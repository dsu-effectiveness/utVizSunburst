HTMLWidgets.widget({

  name: 'sunburst',

  type: 'output',

  factory: function(el, width, height) {

    const sunburst = utviz.createSunburst();
    el.appendChild(sunburst.viz);

    return {

      renderValue: function(x) {

        sunburst.data(x.data);
        sunburst.steps(x.steps);

        if ("palette" in x) {
          sunburst.palette(x.palette);
        };

        sunburst.render();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
