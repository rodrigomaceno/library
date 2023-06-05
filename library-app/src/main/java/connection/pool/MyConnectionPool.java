package connection.pool;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.concurrent.ArrayBlockingQueue;

public class MyConnectionPool {
    private static MyConnectionPool connectionPool;
    private final ArrayBlockingQueue<Connection> connectionList;

    public static final Logger LOGGER = LogManager.getLogger(MyConnectionPool.class.getName());

    private MyConnectionPool() {
        connectionList = new ArrayBlockingQueue<>(5);
    }

    public static MyConnectionPool getConnectionPool() {
        if (connectionPool == null) {
            connectionPool = new MyConnectionPool();
        }
        return connectionPool;
    }

    public Connection getConnection() throws InterruptedException {

        Connection c = connectionList.take();

        LOGGER.info(Thread.currentThread().getName() + " connected");

        return c;
    }

    public void releaseConnection(Connection c) {

        connectionList.offer(c);

        LOGGER.info(Thread.currentThread().getName() + " was released");
    }

    public void initializeConnectionPool(int poolSize) {
        for (int i = 0; i < poolSize; i++) {
            Connection c = new Connection();
            connectionList.offer(c);
        }
        LOGGER.info("ConnectionPool initialized");
    }

}
