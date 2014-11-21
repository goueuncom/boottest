
$(function() {

    var data = [{
        label: "공책",
        data: 500
    }, {
        label: "볼펜",
        data: 250
    }, {
        label: "연필",
        data: 700
    }, {
        label: "싸인펜",
        data: 500
    }];

    var plotObj = $.plot($("#flot-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });

});
