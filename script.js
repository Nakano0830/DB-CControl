function toggleAnswer(id) {
    const ans = document.getElementById(id);
    if (ans.style.display === "block") {
        ans.style.display = "none";
    } else {
        ans.style.display = "block";
    }
}