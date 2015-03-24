# code to great a slide for organizing and automating

draw_scale_of_results = () ->
    h = 600
    w = 900
    colors = ["#7442c8", "#c364c5", "#a8e4a0", "#fd7c6e"]
    bgcolor = "#181818"
    xs = d3.scale.linear().range([0, w]).domain([0, 100])
    ys = d3.scale.linear().range([0, h]).domain([0, 100])
    animation_duration = 1000

    div = d3.select("div#scale_of_results")

    svg = div.append("svg")
             .attr("height", h)
             .attr("width", w)
             .attr("id", "scale_of_results")

    svg.append("rect")
       .attr("x", xs(0))
       .attr("y", ys(0))
       .attr("width", xs(35))
       .attr("height", ys(20))
       .attr("stroke", bgcolor)
       .attr("stroke-width", 1)
       .attr("fill", colors[0])
       .on("click", () -> add_results())
    svg.append("text")
       .attr("x", xs(2.5))
       .attr("y", ys(5))
       .text("genotypes")
       .attr("fill", bgcolor)
       .attr("dominant-baseline", "middle")
       .attr("text-anchor", "start")
       .style("font-size", "30pt")

    svg.append("rect")
       .attr("x", xs(40))
       .attr("y", ys(0))
       .attr("width", xs(60))
       .attr("height", ys(20))
       .attr("stroke", bgcolor)
       .attr("stroke-width", 1)
       .attr("fill", colors[1])
    svg.append("text")
       .attr("x", xs(42.5))
       .attr("y", ys(5))
       .text("phenotypes")
       .attr("fill", bgcolor)
       .attr("dominant-baseline", "middle")
       .attr("text-anchor", "start")
       .style("font-size", "30pt")

    add_results = () ->
        svg.append("rect")
           .attr("x", xs(10))
           .attr("y", ys(35))
           .attr("width", xs(60))
           .attr("height", xs(35))
           .attr("stroke", bgcolor)
           .attr("stroke-width", 1)
           .attr("fill", colors[3])
           .attr("opacity", 0)
           .transition()
           .duration(animation_duration)
           .attr("opacity", 1)
        svg.append("text")
           .attr("x", xs(12.5))
           .attr("y", ys(40))
           .text("results")
           .attr("fill", bgcolor)
           .attr("dominant-baseline", "middle")
           .attr("text-anchor", "start")
           .style("font-size", "30pt")

draw_scale_of_results()
