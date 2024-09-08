// static/js/charts.js

document.addEventListener('DOMContentLoaded', function() {
    var ctx = document.getElementById('scoreChart').getContext('2d');
    
    var chart = new Chart(ctx, {
        type: 'line', // Grafik türü, örneğin 'line', 'bar', 'pie'
        data: {
            labels: [], // Grafik etiketleri (x ekseni)
            datasets: [{
                label: 'KKB Scores',
                data: [], // Grafik verileri (y ekseni)
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Endpoint'ten veri çekme
    fetch('/api/customer_scores')
        .then(response => response.json())
        .then(data => {
            chart.data.labels = data.labels;
            chart.data.datasets[0].data = data.scores;
            chart.update();
        })
        .catch(error => console.error('Error fetching customer scores:', error));
});
