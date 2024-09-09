function doLike(postId, userId, element) {
    console.log(`doLike called with postId: ${postId}, userId: ${userId}`); // Debugging info

    $.ajax({
        url: 'LikeServlet',  // Ensure this matches the servlet URL mapping
        type: 'POST',  // Use POST method as per servlet configuration
        data: { pId: postId, uId: userId },
        success: function(data) {
            console.log("AJAX Success:", data);  // Debugging info

            // Process response
            let responseText = data.trim();  // Ensure no extra whitespace

            let likeCounter = $(element).find('.like-counter');
            let currentCount = parseInt(likeCounter.text(), 10);  // Parse integer

            if (responseText === 'liked') {
                likeCounter.text(currentCount + 1);  // Update like count
            } else if (responseText === 'unliked') {
                likeCounter.text(currentCount - 1);  // Update like count
            } else {
                console.log("Unexpected response:", responseText);  // Debugging info
            }
        },
        error: function(xhr, status, error) {
            console.log("Error in liking the post:", status, error);  // Debugging info
        }
    });
}
