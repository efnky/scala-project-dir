# scala-project-dir

Bölüm 2 — Proje / build yapısı (sbt).

`project/` meta dizini dolu: `build.properties` (sbt.version) + `plugins.sbt`
(sbt-buildinfo 0.12.0, pinli). `build.sbt` kökte. Beklenen ✅: komuta yine kök `build.sbt`
üzerinden `Language="Scala"` tespit eder; `project/` dizini tespiti bozmaz. Minimal JDK
HttpServer 0.0.0.0:8080.

- Dil/Framework: Scala 2.13.16 / saf sbt
- Bağımlılık: yok (JDK HttpServer); sbt plugin: sbt-buildinfo 0.12.0
- Mimari: Monolit
- Port: 8080
- Dockerfile: yok
