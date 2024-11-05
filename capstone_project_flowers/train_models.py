import os
import tensorflow as tf
from data_preparation import prepare_data
from custom_cnn import create_custom_cnn
from transfer_learning import create_vgg16_model, create_resnet50_model
from model_evaluation import plot_training_history

# Create models directory if it doesn't exist
if not os.path.exists('models'):
    os.makedirs('models')

# Prepare data
data_dir = 'Flowers'  # Update this path to your flowers dataset directory
train_generator, validation_generator = prepare_data(data_dir)
num_classes = len(train_generator.class_indices)

# Training parameters
EPOCHS = 20
STEPS_PER_EPOCH = train_generator.samples // train_generator.batch_size
VALIDATION_STEPS = validation_generator.samples // validation_generator.batch_size

# Train and save Custom CNN
print("Training Custom CNN...")
custom_model = create_custom_cnn(num_classes)
checkpoint_path = "models/best_custom_cnn.h5"
checkpoint = tf.keras.callbacks.ModelCheckpoint(
    checkpoint_path,
    monitor='val_accuracy',
    verbose=1,
    save_best_only=True,
    mode='max'
)
custom_history = custom_model.fit(
    train_generator,
    steps_per_epoch=STEPS_PER_EPOCH,
    epochs=EPOCHS,
    validation_data=validation_generator,
    validation_steps=VALIDATION_STEPS,
    callbacks=[checkpoint]
)
custom_model.save('models/custom_cnn.h5')
plot_training_history(custom_history, 'Custom CNN')

# Train and save VGG16
print("Training VGG16...")
vgg16_model = create_vgg16_model(num_classes)
checkpoint_path = "models/best_vgg16_model.h5"
checkpoint = tf.keras.callbacks.ModelCheckpoint(
    checkpoint_path,
    monitor='val_accuracy',
    verbose=1,
    save_best_only=True,
    mode='max'
)
vgg16_history = vgg16_model.fit(
    train_generator,
    steps_per_epoch=STEPS_PER_EPOCH,
    epochs=EPOCHS,
    validation_data=validation_generator,
    validation_steps=VALIDATION_STEPS,
    callbacks=[checkpoint]
)
vgg16_model.save('models/vgg16_model.h5')
plot_training_history(vgg16_history, 'VGG16')

# Train and save ResNet50
print("Training ResNet50...")
resnet_model = create_resnet50_model(num_classes)
checkpoint_path = "models/best_resnet_model.h5"
checkpoint = tf.keras.callbacks.ModelCheckpoint(
    checkpoint_path,
    monitor='val_accuracy',
    verbose=1,
    save_best_only=True,
    mode='max'
)
resnet_history = resnet_model.fit(
    train_generator,
    steps_per_epoch=STEPS_PER_EPOCH,
    epochs=EPOCHS,
    validation_data=validation_generator,
    validation_steps=VALIDATION_STEPS,
    callbacks=[checkpoint]
)
resnet_model.save('models/resnet_model.h5')
plot_training_history(resnet_history, 'ResNet50')

print("All models have been trained and saved in the 'models' directory.") 