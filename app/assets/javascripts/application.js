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

    if ($('#lxc-name')[0].checkValidity() && $('#lxc-alias')[0].checkValidity()) {
        axios({
            method: 'post',
            url: '/lxc/new',
            data: {
              name : $('#lxc-name').val(),
              alias : $('#lxc-alias').val(),
              weight: $('#weight').val(),
              weightValue: $('#weight-value').val(),
            },
            headers: {
              'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
              'Content-Type': 'application/json'
            }
          }).then(() => {
            alert("New LXC Created")
            window.location.replace(`http://localhost:3000`);
          }).catch((err) => {
              console.log(err)
          });
    } else {
        alert("Please fill lxc name / lxc alias !")
    }

}

// Payload(?)
function createNewLxcService() {
    if ($('#service-name')[0].checkValidity() && $('#lxc-port')[0].checkValidity() && $('#lxd-port')[0].checkValidity()) {
        axios({
            method: 'post',
            url: 'lxc-services/new',
            data: {
                service: $('#service-name').val(),
                lxd_port: $('#lxd-port').val(),
                lxc_port: $('#lxc-port').val(),
            },
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                'Content-Type': 'application/json'
              }
            }).then(() => {
              alert("New Lxc Service Created")
              window.location.replace(`http://localhost:3000`);
            });
      } else {
          alert("Please fill all the fields!")
      }
}



function setToLimit() {
    if ($('#weight-value').val() > 100) {
        $('#weight-value').val(() => {
            return 100
        })
    } else if ($('#weight-value').val() < 0) {
        $('#weight-value').val(() => {
            return 1
        })
    }
}

function loadGraph() {
  $("#queryGraph").html("")
  new PromConsole.Graph({
    node: document.querySelector("#queryGraph"),
    width: 900,
    height: 300,
    duration: 3600 * 1,
    min: -10,
    max: 110,
    expr: "avg by (instance) (avg_over_time(node_memory_MemFree_bytes[1h]) / avg_over_time(node_memory_MemTotal_bytes[1h])) + avg by(instance)(irate(node_cpu_seconds_total{mode='idle'}[1h])) / 2 * 100"
  })
}
