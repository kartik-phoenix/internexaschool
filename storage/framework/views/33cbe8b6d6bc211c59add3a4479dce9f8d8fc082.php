<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title><?php echo e(__('login')); ?> || <?php echo e(config('app.name')); ?></title>

    <?php echo $__env->make('layouts.include', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
            <div class="row flex-grow">
                <div class="col-lg-4 mx-auto">

                    <div class="auth-form-light text-left p-5">

                        <div class="brand-logo text-center">
                            
                            <img src="<?php echo e(env('LOGO2') ? asset('public/storage/'. env('LOGO2')) : url('assets/logo.svg')); ?>" alt="logo">
                        </div>
                        <form action="<?php echo e(route('login')); ?>" id="frmLogin" method="POST" class="pt-3">
                            <?php echo csrf_field(); ?>
                            <div class="form-group">
                                <label><?php echo e(__('email')); ?></label>
                                
                                <input id="email" type="email" class="form-control form-control-lg" name="email" value="<?php echo e(old('email')); ?>" required autocomplete="email" autofocus placeholder="<?php echo e(__('email')); ?>">
                            </div>
                            <div class="form-group">
                                <label><?php echo e(__('password')); ?></label>
                                

                                <div class="input-group">
                                    <input id="password" type="password" class="form-control form-control-lg" name="password" required autocomplete="current-password" placeholder="<?php echo e(__('password')); ?>">
                                    <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="fa fa-eye-slash" id="togglePassword"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>

                            <?php if(Route::has('password.request')): ?>
                                <div class="my-2 d-flex justify-content-end align-items-center">

                                    <a class="auth-link text-black" href="<?php echo e(route('password.request')); ?>">
                                        <?php echo e(__('forgot_password')); ?>

                                    </a>
                                </div>
                            <?php endif; ?>
                            <div class="mt-3">
                                <input type="submit" name="btnlogin" id="login_btn" value="<?php echo e(__('login')); ?>" class="btn btn-block btn-theme btn-lg font-weight-medium auth-form-btn"/>
                            </div>
                        </form>
                        <?php if(env('DEMO_MODE')): ?>
                            <div class="row mt-4">
                                <hr class="col-12">
                                <div class="col-12 text-center mb-4 text-black-50">Demo Credentials</div>
                                <div class="col-6 text-left">
                                    <button class="btn btn-block btn-success" id="superadmin_btn">Super Admin</button>
                                </div>
                                <div class="col-6 text-right">
                                    <button class="btn btn-block btn-danger" id="teacher_btn">Teacher</button>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>

<script src="<?php echo e(asset('public/assets/js/vendor.bundle.base.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/js/jquery.validate.min.js')); ?>"></script>
<script src="<?php echo e(asset('public/assets/jquery-toast-plugin/jquery.toast.min.js')); ?>"></script>

<script type='text/javascript'>
    $("#frmLogin").validate({
        rules: {
            username: "required",
            password: "required",
        },
        errorPlacement: function (label, element) {
            label.addClass('mt-2 text-danger');
            label.insertAfter(element);
        },
        highlight: function (element, errorClass) {
            $(element).parent().addClass('has-danger')
            $(element).addClass('form-control-danger')
        }
    });

    const togglePassword = document.querySelector("#togglePassword");
    const password = document.querySelector("#password");

    togglePassword.addEventListener("click", function () {
        const type = password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);
        // this.classList.toggle("fa-eye");
        if (password.getAttribute("type") === 'password') {
            $('#togglePassword').addClass('fa-eye-slash');
            $('#togglePassword').removeClass('fa-eye');
        } else {
            $('#togglePassword').removeClass('fa-eye-slash');
            $('#togglePassword').addClass('fa-eye');
        }
    });

    <?php if(env('DEMO_MODE')): ?>
    $('#superadmin_btn').on('click', function (e) {
        $('#email').val('superadmin@gmail.com');
        $('#password').val('superadmin');
        $('#login_btn').attr('disabled', true);
        $(this).attr('disabled', true);
        $('#frmLogin').submit();
    })
    $('#teacher_btn').on('click', function (e) {
        $('#email').val('teacher@gmail.com');
        $('#password').val('teacher123');
        $('#login_btn').attr('disabled', true);
        $(this).attr('disabled', true);
        $('#frmLogin').submit();
    })
    <?php endif; ?>

</script>
</body>

<?php if(Session::has('error')): ?>
    <script type='text/javascript'>
        $.toast({
            text: '<?php echo e(Session::get('error')); ?>',
            showHideTransition: 'slide',
            icon: 'error',
            loaderBg: '#f2a654',
            position: 'top-right'
        });
    </script>
<?php endif; ?>

<?php if($errors->any()): ?>
    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <script type='text/javascript'>
            $.toast({
                text: '<?php echo e($error); ?>',
                showHideTransition: 'slide',
                icon: 'error',
                loaderBg: '#f2a654',
                position: 'top-right'
            });
        </script>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?>

</html>
<?php /**PATH /var/www/html/internexaschool_clone/resources/views/auth/login.blade.php ENDPATH**/ ?>