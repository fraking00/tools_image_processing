# ISTRUZIONI PER L'USO


Sviluppato in Matlab.

La struttura della cartella `src` di questo progetto è la seguente:

```bash
.
└── src
    ├── cacciavitiImages.list
    ├── cacciavitiLabels.list
    ├── chiave_inglese_images.list
    ├── chiave_inglese_labels.list
    ├── chiave_pappagallo_images.list
    ├── chiave_pappagallo_labels.list
    ├── coltelliImages.list
    ├── coltelliLabels.list
    ├── complessiveTestSetImages.list
    ├── compute_glcm.m
    ├── compute_momenti.m
    ├── compute_momenti_assoluti_invarianti.m
    ├── compute_secondi_momenti.m
    ├── confmat.m
    ├── cropFinalLabels.list
    ├── cropImagesDefinitivo.list
    ├── cucchiaiImages.list
    ├── cucchiaiLabels.list
    ├── forchetteImages.list
    ├── forchetteLabels.list
    ├── labels.list
    ├── main.asv
    ├── main.m
    ├── mean_cacciaviti.mat
    ├── mean_chiave_inglese.mat
    ├── mean_chiave_pappagallo.mat
    ├── mean_coltello.mat
    ├── mean_cucchiaio.mat
    ├── mean_forchetta.mat
    ├── mean_pinza.mat
    ├── mean_taglierino.mat
    ├── mean_trapani.mat
    ├── pinzeImages.list
    ├── pinzeLabels.list
    ├── read_cacciaviti.m
    ├── read_chiave_inglese.m
    ├── read_chiave_pappagallo.m
    ├── read_coltelli.m
    ├── read_crop.m
    ├── read_cucchiai.m
    ├── read_forchette.m
    ├── read_pinze.m
    ├── read_taglierini.m
    ├── read_trapani.m
    ├── readlists.m
    ├── second_readlist.m
    ├── seven_hu_moments.m
    ├── show_confmat.m
    ├── taglieriniImages.list
    ├── taglieriniLabels.list
    ├── test_finale_modelli.mat
    ├── test_print_on_image.m
    ├── testset_segmentation.m
    ├── third_readlist.m
    ├── training_hsv.m
    ├── trapano_images.list
    └── trapano_labels.list
```

Di seguito riportiamo le istruzioni per testare la pipeline.

1. **Aprire il file** ***main.m***

2. Posizionarsi a linea 1166 (ultima sezione del file)

3. selezionare una delle foto possibili di test (`../Dataset/test_set/[nome_file]`)

4. Premere il pulsante per eseguire la sezione

5. La funzione che viene chiamata (`test_print_on_image(image)`) produrrà una immagine in  output con le etichette per ogni oggetto che il modello avrà trovato





***Tutti gli altri file sono di supporto per il funzionamento del sistema. Si prega di non cancellare o modificare nessun altro file***




