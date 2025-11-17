import torch
import torch.nn as nn

# Define the neural network architecture
class SimpleFCNN(nn.Module):
    def __init__(self, input_size=784, hidden_size=500, output_size=10):
        super(SimpleFCNN, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        """Forward pass of the network"""
        out = self.fc1(x)
        out = self.relu(out)
        out = self.fc2(out)
        return out
