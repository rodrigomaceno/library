package com.solvd.laba.connectionpool;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ConnectionPoolApp {
    public static final Logger LOGGER = LogManager.getLogger(ConnectionPoolApp.class.getName());

    public static void main(String[] args) {

        MyConnectionPool connectionPool = MyConnectionPool.getConnectionPool();

        connectionPool.initializeConnectionPool(5);

        int numThreads = 7;

        ExecutorService executorService = Executors.newFixedThreadPool(numThreads);

        CompletableFuture<?>[] futureArr = new CompletableFuture<?>[numThreads];

        for (int i = 0; i < numThreads; i++) {

            CompletableFuture<Void> future = CompletableFuture.supplyAsync(() -> {

                Connection c;

                try {
                    c = connectionPool.getConnection();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }

                connectionPool.releaseConnection(c);

                return null;

            }, executorService);

            futureArr[i] = future;
        }

        CompletableFuture.allOf(futureArr).join();

        executorService.shutdown();

        LOGGER.info("The " + numThreads + " threads finished executing");

    }
}
