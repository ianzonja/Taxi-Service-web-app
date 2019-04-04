$(document).ready(function() {
    $slike = $(".slika-kupon");
    $slike.click(function () {
        var alt = $(this).attr("alt");
        var podrucje = $("#imePodrucja");
        var ime_podrucja = podrucje.text();
        var podrucje2 = $("#sifraPodrucja");
        var sifraPodrucja = podrucje2.text();
        var forma = $("#forma-pregleda-kupona");
        var inputPodrucje = $("#nevidljivi-input-podrucja");
        var inputSlika = $("#nevidljivi-input-slika");
        inputPodrucje.val(sifraPodrucja);
        inputSlika.val(alt);
        alert(inputPodrucje.val());
        alert(inputSlika.val());
        forma.submit();
    });
});
