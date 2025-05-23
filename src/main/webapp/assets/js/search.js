const input = document.getElementById('search-input');
const suggestions = document.getElementById('search-suggestions');

input.addEventListener('input', () => {
    const keyword = input.value.trim();
    if (keyword.length === 0) {
        suggestions.style.display = 'none';
        suggestions.innerHTML = '';
        return;
    }

    fetch(`${window.location.origin}${'${pageContext.request.contextPath}'}/search?keyword=` + encodeURIComponent(keyword))
        .then(response => response.json())
        .then(data => {
            if (data.length === 0) {
                suggestions.innerHTML = '<div style="padding:10px;">Không có kết quả nào</div>';
            } else {
                suggestions.innerHTML = data.map(dish => `
                    <div class="suggestion-item" onclick="selectDish('${dish.name.replace(/'/g, "\\'")}')">
                       <img src="${window.location.origin}${'${pageContext.request.contextPath}'}/assets/img/${dish.img}" alt="${dish.name}" />
                        <div class="info">
                            <div class="name">${dish.name}</div>
                            <div class="description">${dish.description}</div>
                            <div class="price">${dish.price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</div>
                        </div>
                    </div>
                `).join('');
            }
            suggestions.style.display = 'block';
        })
        .catch(() => {
            suggestions.style.display = 'none';
            suggestions.innerHTML = '';
        });
});

function selectDish(name) {
    input.value = name;
    suggestions.style.display = 'none';
    suggestions.innerHTML = '';
}

document.addEventListener('click', e => {
    if (!suggestions.contains(e.target) && e.target !== input) {
        suggestions.style.display = 'none';
    }
});
