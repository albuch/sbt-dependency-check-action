# sbt-dependency-check-action

A Github Action to parse DependencyCheck JSONB reports, print the found vulnerabilities 
and fail the build if a vulnerability was found.

## Usage

The Action takes one configuration parameter:

### `jsonReportPath`
The path to the JSON report file of DependencyCheck. For SBT projects using the default configuration 
of [`sbt-dependency-check`](https://github.com/albuch/sbt-dependency-check) the path is
`target/scala-<version>/sbt-1.0/dependency-check-report.json`.

### Example

```yaml
jobs:
  test:
    steps:
      - name: DependencyCheck
        run: sbt -v -Dfile.encoding=UTF-8 dependencyCheck
      - name: Print DependencyCheck Result
        uses: albuch/sbt-dependency-check-action@v1
        with:
          jsonReportPath: "target/scala-2.12/sbt-1.0/dependency-check-report.json"
```