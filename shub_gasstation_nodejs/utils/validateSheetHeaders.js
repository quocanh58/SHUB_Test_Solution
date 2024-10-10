function validateSheetHeaders(headers) {
  const expectedHeaders = [
    "STT",
    "Ngày",
    "Giờ",
    "Trạm",
    "Trụ bơm",
    "Mặt hàng",
    "Số lượng",
    "Đơn giá",
    "Thành tiền (VNĐ)",
    "Trạng thái thanh toán",
    "Mã khách hàng",
    "Tên khách hàng",
    "Loại khách hàng",
    "Ngày thanh toán",
    "Nhân viên",
    "Biển số xe",
    "Trạng thái hoá đơn",
  ];
  return JSON.stringify(headers) === JSON.stringify(expectedHeaders);
}

module.exports = {
  validateSheetHeaders,
};
