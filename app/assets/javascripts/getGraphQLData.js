$( document ).ready(function() {

var topic = 1;
fetch("http://localhost:3000/graphql", {
  "headers":{
    "accept":"*/*",
    "content-type":"application/json"
  },
  "body":"{\"query\":\"\\n{\\n  topic(id:" + topic + ") {\\n   name\\n    children{\\n      name\\n      children{\\n        name\\n      }\\n    }\\n  }\\n}\\n\\n\",\"variables\":null}",
  "method":"POST",
  "mode":"cors"
  })
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    dataRecieved(myJson);
});


var w = window.innerWidth;
var h = window.innerHeight;

function dataRecieved(d) {
  var data = d.data.topic;
  drawTree(data);
}

function drawTree(data1){

  var treeLayout = d3.tree()
    .size([400, 200]);

  var root = d3.hierarchy(data1);

  treeLayout(root);

  // Nodes
d3.select('svg g.nodes')
  .selectAll('circle.node')
  .data(root.descendants())
  .enter()
  .append('circle')
  .classed('node', true)
  .attr('cx', function(d) {return d.x;})
  .attr('cy', function(d) {return d.y;})
  .attr('r', 4);
  // .append("text")
  // .attr("x", function(d) {return d.x;})
  // .attr("y", function(d) {return d.y;})
  // .text("Node");


// Links
d3.select('svg g.links')
  .selectAll('line.link')
  .data(root.links())
  .enter()
  .append('line')
  .classed('link', true)
  .attr('x1', function(d) {return d.source.x;})
  .attr('y1', function(d) {return d.source.y;})
  .attr('x2', function(d) {return d.target.x;})
  .attr('y2', function(d) {return d.target.y;});

}


});
