# code to great a slide for organizing and automating

draw_orgchart = () ->
    h = 600
    w = 900
    colors = ["#7442c8", "#c364c5", "#a8e4a0", "#fd7c6e"]
    bgcolor = "#181818"
    xs = d3.scale.linear().range([0, w]).domain([0, 100])
    ys = d3.scale.linear().range([0, h]).domain([0, 100])
    animation_duration = 1000

    div = d3.select("div#orgchart")

    svg = div.append("svg")
             .attr("height", h)
             .attr("width", w)
             .attr("id", "orgchart")


    svg.append("rect")
       .attr("x", xs(0))
       .attr("y", ys(0))
       .attr("width", xs(25))
       .attr("height", ys(33))
       .attr("stroke", bgcolor)
       .attr("stroke-width", 1)
       .attr("fill", colors[0])
       .on("click", () -> add_more_genotypes())
    svg.append("text")
       .attr("x", xs(12.5))
       .attr("y", ys(5))
       .text("genotypes")
       .attr("fill", bgcolor)
       .attr("dominant-baseline", "middle")
       .attr("text-anchor", "middle")
       .style("font-size", "30pt")

    svg.append("rect")
       .attr("x", xs(29))
       .attr("y", ys(0))
       .attr("width", xs(30))
       .attr("height", ys(33))
       .attr("stroke", bgcolor)
       .attr("stroke-width", 1)
       .attr("fill", colors[1])
       .on("click", () -> add_more_phenotypes())
    svg.append("text")
       .attr("x", xs(29+15))
       .attr("y", ys(5))
       .text("phenotypes")
       .attr("fill", bgcolor)
       .attr("dominant-baseline", "middle")
       .attr("text-anchor", "middle")
       .style("font-size", "30pt")

    add_more_genotypes = () ->
        x = [34,68]
        svg.selectAll("empty")
           .data(x)
           .enter()
           .append("rect")
           .attr("x", xs(0))
           .attr("y", (d) -> ys(d))
           .attr("width", xs(25))
           .attr("height", ys(33))
           .attr("stroke", bgcolor)
           .attr("stroke-width", 1)
           .attr("fill", colors[0])
           .attr("opacity", 0)
           .transition()
           .duration(animation_duration)
           .delay((d,i) -> i*animation_duration)
           .attr("opacity", 1)


        x = [34,68]
        svg.selectAll("empty")
           .data(x)
           .enter()
           .append("rect")
           .attr("x", xs(29))
           .attr("y", (d) -> ys(d))
           .attr("width", xs(30))
           .attr("height", ys(33))
           .attr("stroke", bgcolor)
           .attr("stroke-width", 1)
           .attr("fill", colors[1])
           .attr("opacity", 0)
           .transition()
           .duration(animation_duration)
           .delay((d,i) -> i*animation_duration)
           .attr("opacity", 1)

    add_more_phenotypes = () ->

        x = [60,60,60, 71,71,71]
        y = [0,34, 68, 0,34,68]
        wid = [10,10,10, 30,30,30]

        col = [colors[2], colors[2], colors[2], colors[3], colors[3], colors[3]]

        svg.selectAll("empty")
           .data(x)
           .enter()
           .append("rect")
           .attr("x", (d) -> xs(d))
           .attr("y", (d,i) -> ys(y[i]))
           .attr("width", (d,i) -> xs(wid[i]))
           .attr("height", ys(33))
           .attr("stroke", bgcolor)
           .attr("stroke-width", 1)
           .attr("fill", (d,i) -> col[i])
           .attr("opacity", 0)
           .transition()
           .duration(animation_duration)
           .delay((d,i) -> i*animation_duration/2)
           .attr("opacity", 1)


draw_orgchart()
