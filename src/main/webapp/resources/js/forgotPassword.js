var otp;
var email;
//tạm thời lưu otp với email trên frontend luôn, sau này mà ứng dụng security sẽ đẩy nó về backend xử lý!
var sendEmail = async () => {
    await axios.post("/UIT-IE303-TravelWeb/api/forgotPassword", {
        email: $("#emailRecovery").val()
    }).then(function(res) {
        switch (parseInt(res.data.status)) {
            case 0:
                $("#noEmail").show();
                break;
            case 1:
                otp = res.data.otp;
                email = emailRecovery.value;
                $("#passForgotModal").modal('toggle');
                $("#otpModal").modal('toggle');
                break;
        }
    })
}

var verifyOTP = () => {
    if (otp == $('#otp').val()) {
        $("#otpModal").modal('toggle');
        $("#newPasswordModal").modal('toggle');
    } else $("#wrongOTP").show();
}

var changePassword = async () => {
    var password = $('#newPassword').val();
    await axios.post("/UIT-IE303-TravelWeb/api/changePassword", {
        email: email,
        password: password
    }).then(() => {
        window.location = "/UIT-IE303-TravelWeb/"
    })
}

$(document).ready(function() {
    $('#noEmail').hide(); $('#wrongOTP').hide();
    $('#resetBtn').on("click", sendEmail);
    $('#otpBtn').on("click", verifyOTP);
    $('#confirmBtn').on("click", changePassword);
})