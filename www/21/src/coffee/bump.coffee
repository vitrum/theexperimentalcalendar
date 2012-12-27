
Bump = do ->

    canvas = document.createElement 'canvas'
    texture = new THREE.Texture canvas
    image = new Image()
    ctx = canvas.getContext '2d'

    image.onload = => Bump.setSize 1000, 1000
    image.src = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAAAAAAZai4+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowMTgwMTE3NDA3MjA2ODExOERCQkU5NDlERjhCOTJBOSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowQjQxMTY3QTIyNzExMUUyQjJCN0FFRTdDNTkwOEVBMyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowQjQxMTY3OTIyNzExMUUyQjJCN0FFRTdDNTkwOEVBMyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M0IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjAxODAxMTc0MDcyMDY4MTE4REJCRTk0OURGOEI5MkE5IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxODAxMTc0MDcyMDY4MTE4REJCRTk0OURGOEI5MkE5Ii8+IDwvcmRmOkRlc2NyaXB0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'
    canvas.style.display = 'none'
    document.body.appendChild canvas

    setSize: ( width, height ) ->

        canvas.width = width
        canvas.height = height

        ctx.fillStyle = ctx.createPattern image, 'repeat'
        ctx.fillRect 0, 0, width, height

        texture.needsUpdate = yes

    texture: texture
    canvas: canvas