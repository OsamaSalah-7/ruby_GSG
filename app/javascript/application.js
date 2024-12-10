// For Rails 7 and Turbo setup
import { Turbo } from 'turbo-rails'; // If using Turbo
import Rails from '@rails/ujs';  // Import rails-ujs for handling delete method
Rails.start();

import Sortable from 'sortablejs';

document.addEventListener('DOMContentLoaded', () => {
  const taskBoard = document.getElementById('task-board');
  if (taskBoard) {
    Sortable.create(taskBoard, {
      onEnd: (event) => {
        // You can send an AJAX request here if needed to update the category
        // Example of AJAX request:
        const taskId = event.item.dataset.taskId;
        const newCategory = event.newIndex;
        // Perform AJAX request to update the task category
        Rails.ajax({
          url: `/tasks/${taskId}`,
          type: 'PATCH',
          data: { task: { category: newCategory } },
          success: (response) => {
            // Handle success
          },
          error: (error) => {
            // Handle error
          }
        });
      }
    });
  }
});
