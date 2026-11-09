# PlantUML, Graphviz and a Java runtime in one small image, so you don't have to install any of them.
FROM eclipse-temurin:25-jre-alpine

# The PlantUML release to bundle. Bump it here, or build with --build-arg PLANTUML_VERSION=...
ARG PLANTUML_VERSION=1.2026.9

RUN apk add --no-cache graphviz font-dejavu fontconfig \
    && wget -q "https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar" -O /opt/plantuml.jar \
    && java -Djava.awt.headless=true -jar /opt/plantuml.jar -version \
    && dot -V

ENV HOME=/tmp
WORKDIR /data

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "/opt/plantuml.jar"]
CMD ["-help"]
