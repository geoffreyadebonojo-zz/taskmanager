$( document ).ready(function() {

function fetchData(){
  var topic_id = $('main').attr("id");
  fetch("http://localhost:3000/graphql", {
  "headers":{
    "accept":"*/*",
    "content-type":"application/json"
  },
  "body":"{\"query\":\"\\n{\\n  topic(id:"+ topic_id +") {\\n    id\\n    name\\n    children{\\n      id\\n      name\\n      children{\\n        id\\n        name\\n         children{\\n        id\\n        name\\n           children{\\n\\t\\t\\t\\t\\t \\tid\\n        \\t\\tname\\n          }\\n        }\\n      }\\n    }\\n  }\\n}\\n\\n\",\"variables\":null}",
  "method":"POST",
  "mode":"cors"
  })
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    var data = myJson.data.topic;
    console.log(data);
    drawTree(data);
  });
};
function drawTree(data){

  var treeLayout = d3.tree()
    .size([800, 400]);

  var root = d3.hierarchy(data);

  treeLayout(root);

  // Nodes
  d3.select('svg g.nodes')
    .selectAll('circle.node')
    .data(root.descendants())
    .enter()
    .append("text")
    .attr("x", function(d) {return 0;})
    .attr("y", function(d) {return 0;})
    .attr('transform', function(d) {return `translate(${d.x + 10}, ${d.y + 20}) rotate(70)`;})
    .html(function(d) {return "<a href='/topics/" + d.data.id + "/main'>" + d.data.name + "</a>";});


  d3.select('svg g.nodes')
    .selectAll('circle.node')
    .data(root.descendants())
    .enter()
    .append('circle')
    .classed('node', true)
    .attr('cx', function(d) {return d.x;})
    .attr('cy', function(d) {return d.y + 20;})
    .attr('r', 10)

  // Links
  d3.select('svg g.links')
    .selectAll('line.link')
    .data(root.links())
    .enter()
    .append('line')
    .classed('link', true)
    .attr('x1', function(d) {return d.source.x;})
    .attr('y1', function(d) {return d.source.y + 20;})
    .attr('x2', function(d) {return d.target.x;})
    .attr('y2', function(d) {return d.target.y + 20;});

}

fetchData();
});
