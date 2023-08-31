<?php $__env->startSection('title'); ?>
    <?php echo e(__('dashboard')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
            <span class="page-title-icon bg-theme text-white mr-2">
                <i class="fa fa-home"></i>
            </span> <?php echo e(__('dashboard')); ?>

            </h3>
        </div>
        <div class="row">
            <?php if($teacher): ?>
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-danger card-img-holder text-white">
                        <div class="card-body">
                            <img src="<?php echo e(asset('public/' . config('global.CIRCLE_SVG'))); ?>" class="card-img-absolute" alt="circle-image"/>
                            <h4 class="font-weight-normal mb-3">Total Teacher <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                            </h4>
                            <h2 class="mb-5"><?php echo e($teacher); ?></h2>
                            
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if($student): ?>
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-info card-img-holder text-white">
                        <div class="card-body">
                            <img src="<?php echo e(asset('public/' . config('global.CIRCLE_SVG'))); ?>" class="card-img-absolute" alt="circle-image"/>
                            <h4 class="font-weight-normal mb-3">Total Students <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                            </h4>
                            <h2 class="mb-5"><?php echo e($student); ?></h2>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
            <?php if($parent): ?>
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="card-body">
                            <img src="<?php echo e(asset('public/' . config('global.CIRCLE_SVG'))); ?>" class="card-img-absolute" alt="circle-image"/>
                            <h4 class="font-weight-normal mb-3">Total Parents <i class="mdi mdi-diamond mdi-24px float-right"></i>
                            </h4>
                            <h2 class="mb-5"><?php echo e($parent); ?></h2>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </div>
        <div class="row">
            <?php if(isset($teachers) && !empty($teachers)): ?>
                <div class="col-md-7 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Teacher</h4>
                            <?php $__currentLoopData = $teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="wrapper d-flex align-items-center py-2 border-bottom">
                                    <img class="img-sm rounded-circle" src="<?php echo e($row->user->image); ?>" alt="profile">
                                    <div class="wrapper ml-3">
                                        <h6 class="ml-1 mb-1"><?php echo e($row->user->first_name.' '.$row->user->last_name); ?></h6>
                                        <small class="text-muted mb-0">
                                            <i class="mdi mdi-map-marker-outline mr-1"></i><?php echo e($row->qualification); ?></small>
                                    </div>
                                    <div class="badge badge-pill badge-success ml-auto px-1 py-1">
                                        <i class="mdi mdi-check"></i>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
            <?php if($boys || $girls): ?>
                <div class="col-md-5 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Gender</h4>
                            <canvas id="gender-ratio-chart"></canvas>
                            <div id="gender-ratio-chart-legend" class="rounded-legend legend-vertical legend-bottom-left pt-4"></div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </div>

        <?php if($announcement): ?>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Noticeboard</h4>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th> No</th>
                                        <th> Title</th>
                                        <th> Description</th>
                                        <th> Date</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $__currentLoopData = $announcement; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td><?php echo e($key+1); ?></td>
                                            <td><?php echo e($row->title); ?></td>
                                            <td><?php echo e($row->description); ?></td>
                                            <td><?php echo e($row->created_at); ?></td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>
    <?php if($boys || $girls): ?>
        <script>
            (function ($) {
                'use strict';
                $(function () {
                    Chart.defaults.global.legend.labels.usePointStyle = true;
                    if ($("#gender-ratio-chart").length) {
                        let ctx = document.getElementById('gender-ratio-chart').getContext("2d")
                        let gradientStrokeBlue = ctx.createLinearGradient(0, 0, 0, 181);
                        gradientStrokeBlue.addColorStop(0, 'rgba(54, 215, 232, 1)');
                        gradientStrokeBlue.addColorStop(1, 'rgba(177, 148, 250, 1)');
                        let gradientLegendBlue = 'linear-gradient(to right, rgba(54, 215, 232, 1), rgba(177, 148, 250, 1))';

                        let gradientStrokeRed = ctx.createLinearGradient(0, 0, 0, 50);
                        gradientStrokeRed.addColorStop(0, 'rgba(255, 191, 150, 1)');
                        gradientStrokeRed.addColorStop(1, 'rgba(254, 112, 150, 1)');
                        let gradientLegendRed = 'linear-gradient(to right, rgba(255, 191, 150, 1), rgba(254, 112, 150, 1))';
                        let trafficChartData = {
                            datasets: [{
                                data: [<?php echo e($boys); ?>, <?php echo e($girls); ?>],
                                backgroundColor: [
                                    gradientStrokeBlue,
                                    gradientStrokeRed
                                ],
                                hoverBackgroundColor: [
                                    gradientStrokeBlue,
                                    gradientStrokeRed
                                ],
                                borderColor: [
                                    gradientStrokeBlue,
                                    gradientStrokeRed
                                ],
                                legendColor: [
                                    gradientLegendBlue,
                                    gradientLegendRed
                                ]
                            }],

                            // These labels appear in the legend and in the tooltips when hovering different arcs
                            labels: [
                                'Boys',
                                'Girls'
                            ]
                        };
                        let trafficChartOptions = {
                            responsive: true,
                            animation: {
                                animateScale: true,
                                animateRotate: true
                            },
                            legend: false,
                            legendCallback: function (chart) {
                                let text = [];
                                text.push('<ul>');
                                for (let i = 0; i < trafficChartData.datasets[0].data.length; i++) {
                                    text.push('<li><span class="legend-dots" style="background:' + trafficChartData.datasets[0].legendColor[i] + '"></span>');
                                    if (trafficChartData.labels[i]) {
                                        text.push(trafficChartData.labels[i]);
                                    }
                                    text.push('<span class="float-right">' + trafficChartData.datasets[0].data[i] + "%" + '</span>')
                                    text.push('</li>');
                                }
                                text.push('</ul>');
                                return text.join('');
                            }
                        };
                        let trafficChartCanvas = $("#gender-ratio-chart").get(0).getContext("2d");
                        let trafficChart = new Chart(trafficChartCanvas, {
                            type: 'doughnut',
                            data: trafficChartData,
                            options: trafficChartOptions
                        });
                        $("#gender-ratio-chart-legend").html(trafficChart.generateLegend());
                    }
                    if ($("#inline-datepicker").length) {
                        $('#inline-datepicker').datepicker({
                            enableOnReadonly: true,
                            todayHighlight: true,
                        });
                    }
                });
            })(jQuery);
        </script>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/internexaschool_clone/resources/views/home.blade.php ENDPATH**/ ?>