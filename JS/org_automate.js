// Generated by CoffeeScript 1.9.1
var draw_orgchart;

draw_orgchart = function() {
  var add_more_genotypes, add_more_phenotypes, animation_duration, bgcolor, colors, div, h, height, svg, w, width, x, xs, y, ys;
  h = 600;
  w = 900;
  colors = ["#7442c8", "#c364c5", "#a8e4a0", "#fd7c6e"];
  bgcolor = "#181818";
  xs = d3.scale.linear().range([0, w]).domain([0, 100]);
  ys = d3.scale.linear().range([0, h]).domain([0, 100]);
  animation_duration = 750;
  x = [0, 40, 71, 82];
  y = [0, 0, 0, 0];
  width = [35, 30, 10, 18];
  height = [19, 19, 19, 19];
  div = d3.select("div#orgchart");
  svg = div.append("svg").attr("height", h).attr("width", w).attr("id", "orgchart");
  svg.selectAll("empty").data([0, 1]).enter().append("rect").attr("x", function(i) {
    return xs(x[i]);
  }).attr("y", function(i) {
    return ys(y[i]);
  }).attr("width", function(i) {
    return xs(width[i]);
  }).attr("height", function(i) {
    return ys(height[i]);
  }).attr("stroke", bgcolor).attr("stroke-width", 1).attr("fill", function(i) {
    return colors[i];
  }).on("click", function(i) {
    if (i === 0) {
      return add_more_genotypes();
    }
    return add_more_phenotypes();
  });
  svg.selectAll("empty").data(["genotypes", "phenotypes"]).enter().append("text").attr("x", function(d, i) {
    return xs(x[i] + 2.5);
  }).attr("y", function(d, i) {
    return ys(y[i] + 5);
  }).text(function(d) {
    return d;
  }).attr("fill", bgcolor).attr("dominant-baseline", "middle").attr("text-anchor", "start").style("font-size", "30pt");
  add_more_genotypes = function() {
    var j, k, results;
    results = [];
    for (j = k = 0; k <= 1; j = ++k) {
      results.push(svg.selectAll("empty").data([1, 2, 3, 4]).enter().append("rect").attr("x", xs(x[j])).attr("y", function(d) {
        return ys(y[j] + (height[j] + 1) * d);
      }).attr("width", xs(width[j])).attr("height", ys(height[j])).attr("stroke", bgcolor).attr("stroke-width", 1).attr("fill", colors[j]).attr("opacity", 0).transition().duration(animation_duration).delay(function(d) {
        return (d - 1) * animation_duration;
      }).attr("opacity", 1));
    }
    return results;
  };
  return add_more_phenotypes = function() {
    var j, k, results;
    results = [];
    for (j = k = 2; k <= 3; j = ++k) {
      results.push(svg.selectAll("empty").data([0, 1, 2, 3, 4]).enter().append("rect").attr("x", xs(x[j])).attr("y", function(d) {
        return ys(y[j] + (height[j] + 1) * d);
      }).attr("width", xs(width[j])).attr("height", ys(height[j])).attr("stroke", bgcolor).attr("stroke-width", 1).attr("fill", colors[j]).attr("opacity", 0).transition().duration(animation_duration / 2).delay(function(d) {
        return (d + (j - 2) * 5) * animation_duration / 2;
      }).attr("opacity", 1));
    }
    return results;
  };
};

draw_orgchart();
