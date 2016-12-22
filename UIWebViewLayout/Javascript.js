




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
    
   // alert(oData.glossary.title)
    
    
    
    
    return true;
}


function setJson(json) {
    
 
    var oData = JSON.parse(json);
 
 
    alert(oData.element_key)
    
    var scope =angular.element(document.getElementById(oData.element_key)).scope()
 
    alert(scope.barLabel)
    
    
    scope.$apply(function(){
                 
                 
            
                 for (i = 0; i < oData.label.length; i++) {
                      scope.barLabel[i] = oData.label[i]

                 }
      
                 })
    
 
    
   
    return true;
}
