# utVizSunburst 0.0.5 *2022-08-12*

-   Add {htmlwidgets} skeleton for a `sunburst()` function

# utVizSunburst 0.0.4 *2022-08-11*

-   Add unit-testing infrastructure
-   Use precommit to help maintain code quality
-   Add a section on development practices / setup to the README
-   Ensured the lintr configuration makes sense for an {htmlwidgets} based package
    - camelCase variables are allowed for shiny/html-interfacing functions/variables
    - but the R API for manipulating the visualizations will use `snake_case`
-   Removed the `object_usage_linter` since this requires the package to be loaded before linting

# utVizSunburst 0.0.3 *2022-08-11*

-   Add files for documenting the package
-   README.md (for describing purpose / installation)
-   A vignette for demonstrating how to use the package, and how it meets the client requirements

# utVizSunburst 0.0.2 *2022-08-11*

-   Add package structure using pm-init
-   Add CODEOWNERS
-   Ensure the bare package passes pm-check / rcmd-check / linting

# utVizSunburst 0.0.1 *2022-08-11*

-   Initial commit
