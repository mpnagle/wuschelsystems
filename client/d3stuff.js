Template.d3.rendered = function()
{

            console.log ("test1")
          //  $(document).on("ready", function(evt) {


                console.log("test2")
                function Plot(arr, domContainer, scrubOtherPlots) {
                    // arr is data, domContainer is where you want your plot appended, scrubOtherPlots is a function that scrubs all the plots including this one

                    var plot = {};

                    plot.update = function(data) {
                        d3.select(domContainer).select('svg').remove()

                        var margin = {top: 10, right: 10, bottom: 10, left: 20};
                        var width = 200 - margin.left - margin.right;
                        var height = 90 - margin.top - margin.bottom;


                        var xScale = d3.scale.linear().domain([1, data.length]).range([0, width]);
                        var yScale = d3.scale.linear().domain(d3.extent(data)).range([height, 0]);
                        this.xScale = xScale;

                        var xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(data.length-1);
                        var yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(0);

                        // var borderArea = d3.svg.area()
                        //     .x(function(d, i) { return xScale(i); })
                        //     .y0(height)
                        //     .y1(function(d) { return yScale(d); });

                        var fillArea = d3.svg.area()
                            .x(function(d, i) {
                                return xScale(i);
                             })
                            .y0(height)
                            .y1(function(d, i) {
                                return yScale(d)+1;
                            })

                        var svg = d3.select(domContainer).append("svg")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                          .append("g")
                            .attr('class','data')
                            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                        this.svg = svg;

                        // svg.append("path")
                        //     .datum(data)
                        //     .attr("class", "area border")
                        //     .attr("d", borderArea);
                        svg.append("path")
                            .datum(data)
                            .attr("class", "area fill")
                            .attr('transform', 'translate(9, 0)') // this is empirical
                            .attr("d", fillArea);

                        svg.append("g")
                            .attr("class", "x axis")
                            .attr("transform", "translate(0," + height + ")")
                            .call(xAxis);

                        svg.append("g")
                            .attr("class", "y axis")
                            .call(yAxis)

                        svg.append("rect")
                            .attr('class','scrubbing')
                            .attr('width', 1)
                            .attr('height', height+6)

                        svg.append("rect")
                            .attr("class", "overlay")
                            .attr("width", width)
                            .attr("height", height+margin.bottom)
                            .on('mousemove', function() {
                                var screenX = d3.mouse(this)[0]
                                var plotX = Math.round(xScale.invert(screenX))
                                scrubOtherPlots(plotX)
                            }).on('mouseenter', function() {
                                svg.select('.scrubbing').style('display', 'block')
                            }).on('mouseleave', function() {
                                svg.select('.scrubbing').style('display', 'none')
                                scrubOtherPlots(null)
                            });
                    }

                    plot.scrub = function(x) {
                        // pass in either the x value being scrubbed over or null for no scrub line
                        var scrubber = this.svg.select('.scrubbing')
                        if (x == null) {
                            scrubber.style('display', 'none')
                        } else {
                            scrubber.attr('x', Math.round(this.xScale(x)))
                            scrubber.style('display', 'block')
                        }
                    }

                    plot.update(arr)
                    return plot;

                }

                function scrubPlots(x) {
                    plot1.scrub(x)
                    plot2.scrub(x)
                }

                var plot1 = Plot([60, 0, 0, 50, 50, 50, 50, 0, 40, 40, 40, 40, 0, 48, 48, 48, 48, 0, 54, 54, 54], document.querySelector('#one'), scrubPlots)
                var plot2 = Plot([5, 5, 5, 5, 10, 8, 8, 8, 8, 10, 8, 8, 8, 8, 11, 9, 9, 9, 9, 12, 10], document.querySelector('#two'), scrubPlots)


                $('button').on('click', function() {
                    plot1.update([0, 10, 10, 10, 0, 0, 10, 5, 5, 0, 0, 10, 6, 6, 0, 0, 10, 6, 6, 0])
                    plot2.update([0, 10, 10, 10, 0, 0, 10, 5, 5, 0, 0, 10, 6, 6, 0, 0, 10, 6, 6, 0].reverse())
                })
            //});
}
