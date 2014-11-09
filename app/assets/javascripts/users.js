  var nodes = [
    // {id: 1, label: 'Node 1'},
    // {id: 2, label: 'Node 2'},
    // {id: 3, label: 'Node 3'},
    // {id: 4, label: 'Node 4'},
    // {id: 5, label: 'Node 5'}
  ];
    // create an array with edges
  var edges = [
    // {from: 1, to: 4},
    // {from: 1, to: 3},
    // {from: 2, to: 4},
    // {from: 2, to: 5}
  ];

$( document ).ready(function() {
  $.ajax({
    url: "users/"+ $('#user').data('user') + "/connections",
    format: "json"
  }).done(function(data){
    // create a local task (task model, view and pushed on to the task list)
    nodes.push({id: $('#user').data('user'), label: 'you'});
    for(var i = 0; i < data.length; i++){
      nodes.push({id: data[i].id, label: data[i].first_name});
      edges.push({from: $('#user').data('user'), to: data[i].id})
    }
  }).done(function(data){
    var container = document.getElementById('mynetwork');
    var data = {
      nodes: nodes,
      edges: edges
    };
    var options = {edges:{style:'arrow-center'}, height: '400px', width: '400px'};
    var network = new vis.Network(container, data, options);
  });



  // create a network

});
