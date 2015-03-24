# code to great a slide for organizing and automating

draw_orgchart = () ->
    h = 600
    w = 900
    colors = ["#7442c8", "#c364c5", "#a8e4a0", "#fd7c6e"]
    bgcolor = "#181818"
    xs = d3.scale.linear().range([0, w]).domain([0, 100])
    ys = d3.scale.linear().range([0, h]).domain([0, 100])
    animation_duration = 750

    x = [0, 40, 71, 82]
    y = [0,  0, 0, 0]
    width =  [35, 30, 10, 18]
    height = [19, 19, 19, 19]

    div = d3.select("div#orgchart")

    svg = div.append("svg")
             .attr("height", h)
             .attr("width", w)
             .attr("id", "orgchart")

    svg.selectAll("empty")
       .data([0,1])
       .enter()
       .append("rect")
       .attr("x", (i) -> xs(x[i]))
       .attr("y", (i) -> ys(y[i]))
       .attr("width", (i) -> xs(width[i]))
       .attr("height", (i) -> ys(height[i]))
       .attr("stroke", bgcolor)
       .attr("stroke-width", 1)
       .attr("fill", (i) -> colors[i])
       .on("click", (i) ->
           return add_more_genotypes() if i==0
           add_more_phenotypes() )
    svg.selectAll("empty")
       .data(["genotypes", "phenotypes"])
       .enter()
       .append("text")
       .attr("x", (d,i) -> xs(x[i] + 2.5))
       .attr("y", (d,i) -> ys(y[i] + 5))
       .text((d) -> d)
       .attr("fill", bgcolor)
       .attr("dominant-baseline", "middle")
       .attr("text-anchor", "start")
       .style("font-size", "30pt")

    add_more_genotypes = () ->
        for j in [0..1]
            svg.selectAll("empty")
               .data([1..4])
               .enter()
               .append("rect")
               .attr("x", xs(x[j]))
               .attr("y", (d) -> ys(y[j]+(height[j]+1)*d))
               .attr("width", xs(width[j]))
               .attr("height", ys(height[j]))
               .attr("stroke", bgcolor)
               .attr("stroke-width", 1)
               .attr("fill", colors[j])
               .attr("opacity", 0)
               .transition()
               .duration(animation_duration)
               .delay((d) -> (d-1)*animation_duration)
               .attr("opacity", 1)

    add_more_phenotypes = () ->
        for j in [2..3]
            svg.selectAll("empty")
               .data([0..4])
               .enter()
               .append("rect")
               .attr("x", xs(x[j]))
               .attr("y", (d) -> ys(y[j]+(height[j]+1)*d))
               .attr("width", xs(width[j]))
               .attr("height", ys(height[j]))
               .attr("stroke", bgcolor)
               .attr("stroke-width", 1)
               .attr("fill", colors[j])
               .attr("opacity", 0)
               .transition()
               .duration(animation_duration/2)
               .delay((d) -> (d+(j-2)*5)*animation_duration/2)
               .attr("opacity", 1)

draw_orgchart()
