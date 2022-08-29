# utVizSunburst 0.2.0 *2022-08-26*

-   User can specify colors for the inner-ring of the sunburst chart using the `palette` argument.

# utVizSunburst 0.1.2 *2022-08-25*

-   Document how to use `sunburst()` (clicking, hovering, how many 'steps' are allowed)
-   Fix bug that disallowed a single variable to be used as 'steps'

# utVizSunburst 0.1.1 *2022-08-23*

-   Use MIT license

# utVizSunburst 0.1.0 *2022-08-13*

-   sunburst(data, steps) adds a sunburst chart to an html page

# utVizSunburst 0.0.7 *2022-08-12*

-   Add an example "admissions" dataset to the package, for use in example code in the vignette.

# utVizSunburst 0.0.6 *2022-08-12*

-   Store the JS dependencies of the sunburst() widget in the package (handlebars 4.7.7; utviz
    "#cdc8842")
-   Define the JS dependencies used by sunburst() in it's .yaml file

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
