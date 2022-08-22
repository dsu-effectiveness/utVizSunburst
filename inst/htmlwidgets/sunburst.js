HTMLWidgets.widget({

  name: 'sunburst',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        const sunburst = utviz
          .createSunburst(x.data, x.steps)
          .render();

        el.appendChild(sunburst.viz);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
