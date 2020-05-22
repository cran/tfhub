## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(tfhub)
#  m <- hub_load("path/to/a/module_dir")

## -----------------------------------------------------------------------------
#  Sys.setenv(TFHUB_CACHE_DIR = "/my_module_cache")

## -----------------------------------------------------------------------------
#  m <- hub_load("https://tfhub.dev/google/progan-128/1")

## -----------------------------------------------------------------------------
#  y <- m(x)

## -----------------------------------------------------------------------------
#  outputs <- m(list(apples=x1, oranges=x2), signature="fruit_to_pet", as_dict=TRUE)
#  y1 = outputs$cats
#  y2 = outputs$dogs

## -----------------------------------------------------------------------------
#  library(keras)
#  
#  mnist <- dataset_mnist()
#  
#  input <- layer_input(shape(28,28), dtype = "int32")
#  
#  output <- input %>%
#    layer_flatten() %>%
#    layer_lambda(tensorflow::tf_function(function(x) tf$cast(x, tf$float32)/255)) %>%
#    layer_dense(units = 10, activation = "softmax")
#  
#  model <- keras_model(input, output)
#  
#  model %>%
#    compile(
#      loss = "sparse_categorical_crossentropy",
#      optimizer = "adam",
#      metrics = "acc"
#    )
#  
#  model %>%
#    fit(x = mnist$train$x, y = mnist$train$y, validation_split = 0.2, epochs =1 )
#  
#  save_model_tf(model, "my_module/", include_optimizer = FALSE)

## -----------------------------------------------------------------------------
#  module <- hub_load("my_module/")
#  
#  predictions <- module(mnist$test$x) %>%
#    tf$argmax(axis = 1L)
#  
#  mean(as.integer(predictions) == mnist$test$y)

