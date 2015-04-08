var FormValidation = function () {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            var form1 = $('#form_sample_1');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);
			
			

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
					account: {
						minlength: 2,
                        required: true
					},
                    name: {
                        minlength: 3,
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
					oldPwd: {
						required: true
					},
					newPwd:{
						required: true,
						rangelength:[6,16]
					},
					confirmPwd:{
						required: true,
						equalTo:"#newPwd"
					},
					phone: {
						required: true,
						digits:true,
						rangelength:[6,11]
					},
                    url: {
                        required: true,
                        url: true
                    },
                    number: {
                        required: true,
                        number: true
                    },
                    digits: {
                        required: true,
                        digits: true
                    },
                    creditcard: {
                        required: true,
                        creditcard: true
                    },
                    occupation: {
                        minlength: 5
                    },
                    category: {
                        required: true
                    },
                    startDate: {
						required: true,
						date: true
					},
					endDate: {
						required: true,
						date: true
					}
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },
				
				

                submitHandler: function (form) {
                    success1.show();
                    error1.hide();
					
					form.submit(); 
                }
				
				
				
            });
			$("button:reset").click(function() {
				error1.hide();
				success1.hide();
				$("label.error").closest('.control-group').hide();
				$("label.success").closest('.control-group').hide();
				$(".error").closest('.control-group').removeClass('error');
				$(".success").closest('.control-group').removeClass('success');
				
    			form1.validate().resetForm();
				
			});
			
    }

    return {
        //main function to initiate the module
        init: function () {

            handleValidation1();
			

        },

	// wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                    scrollTop: pos + (offeset ? offeset : 0)
                }, 'slow');
        }

    };

}();
