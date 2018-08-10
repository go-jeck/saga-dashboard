// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function saveNewLxc() {
    axios({
        method: 'post',
        url: '/lxc/new',
        data: {
          name : $('#lxc-name').val(),
          type : $('#lxc-type').val(),
          protocol : $('#lxc-protocol').val(),
          server : $('#lxc-server').val(),
          alias : $('#lxc-alias').val()
        },
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
          'Content-Type': 'application/json'
        }
      }).then(() => {
        alert("New LXC Created")
        window.location.replace(`http://localhost:3000`);
      });
}

function loadGraph() {
  $("#queryGraph").html("")
  new PromConsole.Graph({
    node: document.querySelector("#queryGraph"),
    width: 900,
    height: 300,
    duration: 3600 * 1,
    min: 20,
    max: 110,
    expr: "avg by (instance) (avg_over_time(node_memory_MemFree_bytes[1h]) / avg_over_time(node_memory_MemTotal_bytes[1h])) + avg by(instance)(irate(node_cpu_seconds_total{mode='idle'}[1h])) / 2 * 100"
  })
}