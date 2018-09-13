#!/bin/sh

java -javaagent:/app/deployment/newrelic/newrelic.jar -jar /app/build/libs/buildkite-demo.jar
