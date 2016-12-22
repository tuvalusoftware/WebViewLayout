


function setDimensions ()
{
    if (window.labels == null){
        
        
        window.labels =  ["Dog", "Cat", "Horse", "Lizard", "Frog", "Toad", "Bird"];
        window.data =  [
                        [65, 59, 90, 81, 56, 55, 40],
                        [28, 48, 40, 19, 96, 27, 100]
                        ];
        window.series = ['Series A', 'Series B'];
    }
    else
    {
        
        
    }
}

function printData() {
    
    
    
    
    var oData = JSON.parse(window.json);
    
    
    
    
    
    
    return true;
}

function setAllHidden()
{
    
    document.getElementById("horizontal-bar-id").style.display = "none";
    document.getElementById("pie-id").style.display = "none";
    document.getElementById("bar-id").style.display = "none";
    document.getElementById("radar-id").style.display = "none";
    document.getElementById("polar-id").style.display = "none";
}
function setJson(json) {
    
    
    var oData = JSON.parse(json);
    
    setAllHidden()
    
    
    var scope =angular.element(document.getElementById(oData.element_key)).scope()
    
    document.getElementById(oData.element_key).style.display = "inline";
    scope.$apply(function(){
                 
                 
                 
                 for (i = 0; i < oData.label.length; i++) {
                 scope.labels[i] = oData.label[i]
                 
                 }
                 
                 })
    
    
    
    
    return true;
}
