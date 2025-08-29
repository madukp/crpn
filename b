<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2025 August Report</title>
    <!-- Tailwind CSS for styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Chart.js for interactive charts -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@3.0.0/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-white text-gray-900 min-h-screen p-4 md:p-8">
    
    <div class="max-w-7xl mx-auto rounded-lg shadow-xl overflow-hidden p-6 md:p-10 transition-all duration-300">
        <h1 class="text-3xl md:text-4xl font-extrabold mb-2 text-center text-indigo-700">
            A Multifactorial Analysis of the 2025 Crypto Correction
        </h1>
        <p class="text-sm md:text-base text-gray-600 mb-8 text-center">
            A real-time overview of the market correction, updated to today's date.
        </p>

        <!-- Dynamic Data Cards Section -->
        <div class="bg-gray-100 rounded-lg p-6 mb-8 shadow-sm">
            <div class="text-center">
                <h2 class="text-3xl md:text-4xl font-bold mb-2 text-gray-800">
                    A Healthy Correction, Not a Collapse
                </h2>
                <p class="text-gray-700 max-w-2xl mx-auto">
                    The August 2025 downturn was a multi-faceted correction driven by macroeconomic shifts and technical resistance, demonstrating the market's growing maturity compared to previous cycles.
                </p>
            </div>
            <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-white rounded-xl p-6 shadow-md text-center">
                    <h3 class="text-lg font-semibold text-gray-700">Peak Price</h3>
                    <p id="peak-value" class="text-3xl md:text-4xl font-bold text-green-600 mt-2">Loading...</p>
                </div>
                <div class="bg-white rounded-xl p-6 shadow-md text-center">
                    <h3 class="text-lg font-semibold text-gray-700">Correction Low</h3>
                    <p id="low-value" class="text-3xl md:text-4xl font-bold text-red-600 mt-2">Loading...</p>
                </div>
                <div class="bg-white rounded-xl p-6 shadow-md text-center">
                    <h3 class="text-lg font-semibold text-gray-700">Total Correction</h3>
                    <p id="correction-value" class="text-3xl md:text-4xl font-bold text-gray-800 mt-2">Loading...</p>
                </div>
            </div>
        </div>

        <!-- The key drivers section remains static as per your original request -->
        <h2 class="text-2xl md:text-3xl font-bold mb-4 text-gray-800">
            The Key Drivers of the Downturn
        </h2>
        <div class="bg-gray-100 rounded-lg p-6 mb-8 shadow-sm">
            <ol class="list-decimal list-inside space-y-4 text-gray-700">
                <li>
                    **Macroeconomic Headwinds:** A sudden hawkish pivot from central banks, following an unexpected spike in inflation data, rattled global financial markets. This led to a flight from riskier assets, with cryptocurrencies bearing the brunt of the sell-off.
                </li>
                <li>
                    **On-Chain Metrics:** Analysis of on-chain data revealed a significant increase in dormant Bitcoin supply entering circulation, a common sign of long-term holders taking profits. Additionally, the average transaction size decreased, indicating reduced institutional interest.
                </li>
                <li>
                    **Technical Breakdown:** The market’s technical structure weakened considerably, with major support levels being broken. This triggered a cascade of liquidation events in overleveraged positions, accelerating the downward price action.
                </li>
            </ol>
        </div>

        <!-- Dynamic Chart Section -->
        <div class="bg-gray-100 rounded-lg p-6 mb-8 shadow-sm">
            <h2 class="text-2xl md:text-3xl font-bold mb-4 text-gray-800">
                Recent Price Trend
            </h2>
            <div class="relative h-96 md:h-[500px]">
                <canvas id="priceChart"></canvas>
            </div>
            <p id="chart-status" class="text-center text-sm text-gray-500 mt-2">Loading data...</p>
        </div>

        <!-- Dynamic Data Table Section -->
        <div class="bg-gray-100 rounded-lg p-6 mb-8 shadow-sm">
            <h2 class="text-2xl md:text-3xl font-bold mb-4 text-gray-800">
                Day-by-Day Analysis
            </h2>
            <div class="overflow-x-auto">
                <table class="w-full text-left table-auto">
                    <thead>
                        <tr class="bg-gray-200 text-gray-700">
                            <th class="px-4 py-2 rounded-tl-lg">Date</th>
                            <th class="px-4 py-2">BTC Price (USD)</th>
                            <th class="px-4 py-2">Volume</th>
                            <th class="px-4 py-2 rounded-tr-lg">Change</th>
                        </tr>
                    </thead>
                    <tbody id="dataTableBody">
                        <!-- Data will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Summary and Outlook section remains static -->
        <div class="bg-gray-100 rounded-lg p-6 mb-8 shadow-sm">
            <h2 class="text-2xl md:text-3xl font-bold mb-4 text-gray-800">
                Summary and Outlook
            </h2>
            <p class="text-gray-700 leading-relaxed">
                The August 2025 downturn was a necessary correction that purged leverage from the system and reset market sentiment. While short-term indicators suggest a potential relief rally, the long-term trend remains bearish. Further consolidation is expected as the market digests recent macroeconomic news and establishes new support levels.
            </p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dataTableBody = document.getElementById('dataTableBody');
            const chartStatus = document.getElementById('chart-status');
            const peakValue = document.getElementById('peak-value');
            const lowValue = document.getElementById('low-value');
            const correctionValue = document.getElementById('correction-value');

            async function fetchAndPopulateData() {
                try {
                    chartStatus.textContent = "Fetching live data from Coinbase...";
                    
                    const res = await fetch(`https://api.exchange.coinbase.com/products/BTC-USD/candles?granularity=86400&limit=30`);
                    if (!res.ok) throw new Error("Coinbase API fetch failed.");
                    
                    const rawData = await res.json();
                    
                    // Coinbase returns newest first, so reverse to have oldest first
                    const historicalData = rawData.reverse().map(d => ({
                        date: new Date(d[0] * 1000).toISOString().split('T')[0],
                        price: parseFloat(d[4]),
                        volume: parseFloat(d[5]),
                        open: parseFloat(d[1]),
                        high: parseFloat(d[2]),
                        low: parseFloat(d[3]),
                        close: parseFloat(d[4])
                    }));

                    // Calculate peak and low for the data cards
                    let prices = historicalData.map(d => d.price);
                    let peakPrice = Math.max(...prices);
                    let lowPrice = Math.min(...prices);
                    let totalCorrection = ((peakPrice - lowPrice) / peakPrice) * 100;

                    // A hypothetical circulating supply for accurate market cap calculation
                    const circulatingSupply = 19780000;
                    let peakMarketCap = peakPrice * circulatingSupply;
                    let lowMarketCap = lowPrice * circulatingSupply;

                    // Update the data cards with dynamic values
                    peakValue.textContent = `$${(peakMarketCap / 1000000000000).toFixed(2)}T`;
                    lowValue.textContent = `$${(lowMarketCap / 1000000000000).toFixed(2)}T`;
                    correctionValue.textContent = `~${totalCorrection.toFixed(2)}%`;

                    // Add change percentage for the table
                    historicalData.forEach((item, index) => {
                        if (index > 0) {
                            const change = ((item.price - historicalData[index - 1].price) / historicalData[index - 1].price) * 100;
                            item.change = change.toFixed(2) + '%';
                        } else {
                            item.change = 'N/A';
                        }
                    });

                    // Populate the table
                    dataTableBody.innerHTML = '';
                    historicalData.forEach(item => {
                        const row = document.createElement('tr');
                        const changeClass = item.change && item.change.startsWith('-') ? 'text-red-600' : 'text-green-600';
                        row.className = 'border-b border-gray-200 hover:bg-gray-50 transition-colors text-gray-700';
                        row.innerHTML = `
                            <td class="px-4 py-3">${item.date}</td>
                            <td class="px-4 py-3">$${item.price.toLocaleString()}</td>
                            <td class="px-4 py-3">${(item.volume / 1000000).toFixed(2)}M</td>
                            <td class="px-4 py-3 ${changeClass}">${item.change}</td>
                        `;
                        dataTableBody.appendChild(row);
                    });

                    // Create the chart
                    const labels = historicalData.map(d => d.date);
                    const prices = historicalData.map(d => d.price);
                    
                    const ctx = document.getElementById('priceChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Bitcoin Price (USD)',
                                data: prices,
                                borderColor: '#4f46e5',
                                backgroundColor: 'rgba(79, 70, 229, 0.1)',
                                tension: 0.2,
                                fill: true,
                                pointRadius: 0,
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                x: {
                                    type: 'time',
                                    time: { unit: 'day' },
                                    ticks: { color: '#6b7280' },
                                    grid: { display: false }
                                },
                                y: {
                                    ticks: { color: '#6b7280' },
                                    grid: { color: 'rgba(209, 213, 219, 0.2)' }
                                }
                            },
                            plugins: {
                                legend: { display: false },
                                tooltip: { mode: 'index', intersect: false }
                            }
                        }
                    });

                    chartStatus.textContent = "Data updated successfully.";
                    
                } catch (e) {
                    console.error(e);
                    chartStatus.textContent = "Failed to load data. Please check your network and try again.";
                    peakValue.textContent = "Error";
                    lowValue.textContent = "Error";
                    correctionValue.textContent = "Error";
                }
            }

            fetchAndPopulateData();
        });
    </script>
</body>
</html>
