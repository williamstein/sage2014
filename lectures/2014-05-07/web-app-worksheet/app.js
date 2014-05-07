$(".app-button").click(function(e) {

    n = parseFloat($(".app-input").val());

    worksheet.execute_code({
        code: "print a; salvus.data['n'] * random()",
        data: {n:n},
        preparse: true,
        cb : function(mesg) {
            console.log(mesg);
            if (mesg.stdout) {
                $(".app-output").append(mesg.stdout);
            }
        }
    })
})