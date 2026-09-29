// main.js - UNISHOP Supplier Site

document.addEventListener('DOMContentLoaded', () => {
    // Initialize Charts if canvases exist
    const pieCanvas = document.getElementById('pieChart');
    const barCanvas = document.getElementById('barChart');

    // Pastel Palette matching CSS variables
    const colors = {
        red: '#FF544C',
        teal: '#2AB0A3',
        yellow: '#FFE458',
        orange: '#FE9A34',
        cream: '#FFF0C2'
    };

    if (pieCanvas) {
        new Chart(pieCanvas, {
            type: 'doughnut',
            data: {
                labels: ['Mercearia', 'Hortifruti', 'Laticínios', 'Bebidas', 'Açougue'],
                datasets: [{
                    data: [35, 20, 15, 10, 20],
                    backgroundColor: [
                        colors.teal,
                        colors.orange,
                        colors.red,
                        colors.yellow,
                        colors.cream
                    ],
                    borderWidth: 3,
                    borderColor: '#ffffff',
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '65%',
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            font: {
                                family: "'Outfit', sans-serif"
                            },
                            usePointStyle: true,
                            padding: 20
                        }
                    }
                }
            }
        });
    }

    if (barCanvas) {
        new Chart(barCanvas, {
            type: 'bar',
            data: {
                labels: ['Arroz Branco 5kg', 'Leite Integral 1L', 'Óleo de Soja 900ml', 'Café em Pó 500g'],
                datasets: [{
                    label: 'Quantidade em Estoque',
                    data: [250, 420, 320, 180],
                    backgroundColor: colors.orange,
                    borderRadius: 6,
                    barThickness: 'flex',
                    maxBarThickness: 40
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0,0,0,0.05)',
                            drawBorder: false
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    }
});
