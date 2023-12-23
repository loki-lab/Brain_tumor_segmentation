<h1>Máy phát hiện U não</h1>
<h2>Bài toán</h2>
<p>Với bài toán y sinh khoanh vùng khu vực có chứa khối u não từ những tấm ảnh MRI, chúng tôi đã áp dụng unet </br>
    để có thể phân đoạn hình ảnh xác định vị trí của khối u não.</p>
<div>
    <img src="assets/demo.png" alt="" width="600">
</div>
<h2>GUI Application</h2>
<div>
    <p>Đây là phần GUI của app AI. Chúng tôi đã tạo lên một GUI đơn giản với Tkinter và nó sẽ phụ trách việc tương tác </br>
        với model qua API và trực quan quá trình làm việc một cách dễ dàng.</p>
    <img src="assets/image.png" alt="" width="350">
    <img src="assets/image-1.png" alt="" width="350">
</div>
<h2>Cài đặt AI</h2>
<h3>Những thứ cần chuẩn bị</h3>
<p>
    - Docker 
    - Python 3.9 
    - Model Unet (tải tại đây:)
</p>
<h3>Cài đặt model</h3>
<p>Chúng ta sẽ cần clone github này về và sử dụng model unet đã được chúng tôi train ở phần chuẩn bị. Hãy bỏ model vào </br>
    thư mục: \model\deploy\model_repository\unet_model\1
</p>
<p>Để serving model, chúng ta cần chạy lệnh docker ở phía bên dưới trong thư mục model/deploy:</br>
    "docker run --gpus=1 --rm --net=host -v ${PWD}/model_repository:/models nvcr.io/nvidia/tritonserver:23.11-py3 tritonserver --model-repository=/models"
</p>
<h2>Training model Unet</h2>
<p>Bạn có thể tham khảo thêm cách training ở notebook chứa trong thư mục model/training </p>

