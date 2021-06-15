var otp;
var email;
//tạm thời lưu otp với email trên frontend luôn, sau này mà ứng dụng security sẽ đẩy nó về backend xử lý!
var status = document.getElementById("status")

var sendEmail = async () => {
    await axios.post("/UIT-IE303-TravelWeb/api/forgotPassword", {
        email: $("#emailRecovery").val()
    }).then(function(res) {
        switch (parseInt(res.data.status)) {
            case 0:
                console.log(res.data.status);
                break;
            case 1:
                otp = res.data.otp;
                email = emailRecovery.value;
                $("#passForgotten").modal('toggle');
                $("#otpModal").modal('toggle');
                break;
        }
    })
}

var verifyOTP = () => {
    if (otp == $('#otp').val()) {
        $("#otpModal").modal('toggle');
        $("#newPasswordModal").modal('toggle');
    }
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
    $('#recover').on("click", sendEmail);
    $('#verifyOTP').on("click", verifyOTP);
    $('#changePassword').on("click", changePassword);
})