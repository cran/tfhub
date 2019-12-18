## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  eval = identical(Sys.getenv("EVAL_VIGNETTE", "false"), "true") ||identical(Sys.getenv("CI"), "true") 
)

## ------------------------------------------------------------------------
#  library(keras)
#  library(tfhub)
#  library(magick)

## ------------------------------------------------------------------------
#  classifier_url <- "https://tfhub.dev/google/tf2-preview/mobilenet_v2/classification/2"
#  mobilenet_layer <- layer_hub(handle = classifier_url)

## ------------------------------------------------------------------------
#  input <- layer_input(shape = c(224, 224, 3))
#  output <- input %>%
#    mobilenet_layer()
#  
#  model <- keras_model(input, output)

## ------------------------------------------------------------------------
#  img <- image_read('https://storage.googleapis.com/download.tensorflow.org/example_images/grace_hopper.jpg') %>%
#    image_resize(geometry = "224x224x3!") %>%
#    image_data() %>%
#    as.numeric() %>%
#    abind::abind(along = 0) # expand to batch dimension

## ---- echo=FALSE---------------------------------------------------------
#  plot(as.raster(img[1,,,]))

## ------------------------------------------------------------------------
#  result <- predict(model, img)
#  mobilenet_decode_predictions(result[,-1, drop = FALSE])

## ------------------------------------------------------------------------
#  data_root <- pins::pin("https://storage.googleapis.com/download.tensorflow.org/example_images/flower_photos.tgz", "flower_photos")
#  data_root <- fs::path_dir(fs::path_dir(data_root[100])) # go down 2 levels

## ------------------------------------------------------------------------
#  image_generator <- image_data_generator(rescale = 1/255, validation_split = 0.2)
#  training_data <- flow_images_from_directory(
#    directory = data_root,
#    generator = image_generator,
#    target_size = c(224, 224),
#    subset = "training"
#  )
#  
#  validation_data <- flow_images_from_directory(
#    directory = data_root,
#    generator = image_generator,
#    target_size = c(224, 224),
#    subset = "validation"
#  )

## ------------------------------------------------------------------------
#  feature_extractor_url <- "https://tfhub.dev/google/tf2-preview/mobilenet_v2/feature_vector/2"
#  feature_extractor_layer <- layer_hub(handle = feature_extractor_url)

## ------------------------------------------------------------------------
#  input <- layer_input(shape = c(224, 224, 3))
#  output <- input %>%
#    feature_extractor_layer() %>%
#    layer_dense(units = training_data$num_classes, activation = "softmax")
#  
#  model <- keras_model(input, output)
#  summary(model)

## ------------------------------------------------------------------------
#  model %>%
#    compile(
#      loss = "categorical_crossentropy",
#      optimizer = "adam",
#      metrics = "acc"
#    )

## ------------------------------------------------------------------------
#  model %>%
#    fit_generator(
#      training_data,
#      steps_per_epoch = training_data$n/training_data$batch_size,
#      validation_data = validation_data
#    )

## ------------------------------------------------------------------------
#  save_model_tf(model, "model")

## ------------------------------------------------------------------------
#  reloaded_model <- load_model_tf("model")

## ------------------------------------------------------------------------
#  steps <- as.integer(validation_data$n/validation_data$batch_size)
#  all.equal(
#    predict_generator(model, validation_data, steps = steps),
#    predict_generator(reloaded_model, validation_data, steps = steps),
#  )

