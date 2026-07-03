import com.sun.net.httpserver.{HttpServer, HttpExchange, HttpHandler}
import java.net.InetSocketAddress

object Main {
  def main(args: Array[String]): Unit = {
    val server = HttpServer.create(new InetSocketAddress("0.0.0.0", 8080), 0)
    server.createContext("/", new HttpHandler {
      def handle(ex: HttpExchange): Unit = {
        val body = "scala-project-dir (project/ meta dir: build.properties + plugins.sbt, port 8080)".getBytes("UTF-8")
        ex.sendResponseHeaders(200, body.length.toLong)
        val os = ex.getResponseBody
        os.write(body)
        os.close()
      }
    })
    server.setExecutor(null)
    server.start()
    println("scala-project-dir listening on 0.0.0.0:8080")
  }
}
