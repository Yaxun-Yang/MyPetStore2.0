
$(function()
{
    //获取所有的除了全选的checkbox

    var cks= $(':checkbox:gt(0)');
    //给全选checkbox绑定click事件
    var allCheck=$('#allCheck').click(
        function()
        {
            //让所有非全选checkbox checked状态和全选checkbox一致
            cks.prop("checked", $(this).prop("checked"));
        }
    )
    //每个非全选checkbox绑定事件
    cks.click(
        function()
        {
            if(!$(this).prop('checked'))
            {
                //有不是选中的则修改全选的未非选中
                allCheck.prop('checked',false);
            }
            else
            {
                //检查所有的非全选的checkbox是否是选中的
                if(cks.filter($(':not(:checked)')).length==0)
                {
                    allCheck.prop('checked',true);
                }
            }
        })
});

//$(function(){$(":checkbox[name = categoryCheck]").each(function () {
//     var allCheck = this;
//     var  thisClass= this.class;
//     var cks = $().find(thisClass).not(this);
//     $(this).click(
//         function()
//         {
//             //让所有非全选checkbox checked状态和全选checkbox一致
//             cks.prop("checked", $(this).prop("checked"));
//         })
//
//     cks.click(function () {
//         if(!$(this).prop('checked'))
//         {
//             //有不是选中的则修改全选的未非选中
//             allCheck.prop('checked',false);
//         }
//         else
//         {
//             //检查所有的非全选的checkbox是否是选中的
//             if(cks.filter($(':not(:checked)')).length==0)
//             {
//                 allCheck.prop('checked',true);
//             }
//         }
//     })
// })
// });

$(function () {
    $(".quantity").bind('input propertychange',function () {
        var quantity = this.value;
        var workingItemId = this.id;
        var num = this.name;
        $.ajax({
            type: "POST",
            url: "updateCartJS?quantity=" + quantity + "&workingItemId=" + workingItemId,
            dataType:"json",
            data:{},
            success: function (result) {

                $("#subTotal").text(result.subTotal);
                $(".total").eq(num).text(result.totalCost);

            }
        })
    })

});