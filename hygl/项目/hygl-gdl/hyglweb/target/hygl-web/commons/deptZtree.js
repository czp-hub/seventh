

    function initDeptZtree() {
        $.ajax({
            url:"http://localhost:8093/dept",
            type:"get",
            success:function(result) {
                console.log(result)
                var setting = {
                    data: {
                        simpleData: {
                            enable: true
                        },
                        key: {
                            url: "xUrl"
                        }
                    }
                    ,callback: {
                        onClick: categroyClick    //树的点击事件  没有配置
                    }
                };
               var treeObj= $.fn.zTree.init($("#deptTree"), setting, result);
                treeObj.expandAll(true);
            }

        })
    }
