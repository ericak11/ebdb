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
  }).done(function(info){
    // create a local task (task model, view and pushed on to the task list)
    nodes.push({id: $('#user').data('user'), label: 'YOU', group: 'user'});
    for(var i = 0; i < info.length; i++){
      if(info[i].gender === 'Male') {
        nodes.push({id: info[i].id, label: info[i].first_name, group: 'male'});
      } else{
        nodes.push({id: info[i].id, label: info[i].first_name, group: 'female'});
      }
      edges.push({from: $('#user').data('user'), to: info[i].id});
      callForMatches(info[i].id);
    }
  });
});

function callForMatches(newid) {
  $.ajax({
    url: "users/"+ newid + "/connections",
    format: "json"
  }).done(function(newData){
    // create a local task (task model, view and pushed on to the task list)
    for(var i = 0; i < newData.length; i++){
      if (newData[i].id !== $('#user').data('user')) {
        if(newData[i].gender === 'Male') {
          nodes.push({id: newData[i].id, label: newData[i].first_name, group: 'male'});
        } else {
          nodes.push({id: newData[i].id, label: newData[i].first_name, group: 'female'});
        }
        edges.push({from: newid, to: newData[i].id});
      }
    }
  }).done(function(data){
    var container = document.getElementById('mynetwork');
    nodes.sort( function( a, b){ return a.id - b.id; } );
    // delete all duplicates from the array
    for( var i=0; i<nodes.length-1; i++ ) {
      if ( nodes[i].id == nodes[i+1].id ) {
        delete nodes[i];
      }
    }
    // remove the "undefined entries"
    nodes = nodes.filter( function( el ){ return (typeof el !== "undefined"); } );
    var data = {
      nodes: nodes,
      edges: edges
    };

    var options = {edges:{style:'arrow-center'}, height: '400px', width: '400px',
        groups: {
          user: {
            // defaults for nodes in this group
            radius: 45,
            color: 'black',
            fontColor: 'white',
            fontSize: 18,
            fontFace: 'courier',
            shape: 'box'
          },
          female: {
            radius: 20,
            color: {
              border: 'black',
              background: 'red',
              highlight: {
                border: 'black',
                background: 'lightgray'
              }
            },
            fontFace: 'arial',
            shape: 'circle'
          },
          male: {
            radius: 100,
            color: {
              border: 'black',
              background: 'blue'
            },
            fontColor: 'black',
            shape: 'dot',
          }
        }};
    var network = new vis.Network(container, data, options);
  });
}

