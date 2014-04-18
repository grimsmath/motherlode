function codeAddress(addressElem) {
    addressSelector = $('#' + addressElem.id);
    rowSelector = addressSelector.closest('tr');

    geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': addressSelector.val() }, function(results, status) {
        addressSelector.val(results[0].formatted_address);
        if (status == google.maps.GeocoderStatus.OK) {
            rowSelector.find('.latitude').val(results[0].geometry.location.A);
            rowSelector.find('.longitude').val(results[0].geometry.location.k);
        }
        else {
            console.log("Geocode was not successful for the following reason: " + status);
        }
    });
}