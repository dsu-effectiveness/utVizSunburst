# utVizSunburst 0.4.0 *2022-09-09*

-   New feature: User can supply mouse-over, mouse-out or alt-click handlers to the `sunburst()`
    function which allow widget-associated path data to be accessed from Shiny.
-   An example shiny app that shows path-data upon mouse-over has been added.
-   A function to run example shiny apps has been added: `run_shiny_example("mouse_over")`.

# utVizSunburst 0.3.0 *2022-09-06*

-   New feature: User can override color scheme for the rings and sectors of a sunburst chart using
    `color_overrides` argument to `sunburst()`.
-   Use updated version of utviz JS library (`c8d1ee` v1.0.1) allows mouseover / mouseout handlers
    on sunburst charts.

# utVizSunburst 0.2.3 *2022-09-02*

-   Ensure that `el.appendChild()` is called once for each sunburst chart, rather than on each call
    to `renderValue()`. This prevents multiple charts being added to the same HTML element.

# utVizSunburst 0.2.2 *2022-09-02*

-   Documented the use of shift-clicking to expand a drilled-down chart one level at a time.

# utVizSunburst 0.2.1 *2022-08-30*

-   Use updated version of utviz JS library (`3bb665d`) that allows length-1 palette vectors to be
    used in Sunburst charts
-   Document the reuse of palette colors when fewer colors are provided than there are levels of
    the inner category

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
    `#cdc8842`)
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
