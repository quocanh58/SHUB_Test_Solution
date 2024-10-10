export class Transaction {
   id: number;
   date: Date;  // Ngày
   time: string;  // Giờ
   station: string;  // Trạm
   pumpPole: string;  // Trụ bơm
   item: string;  // Mặt hàng
   quantity: number;  // Số lượng
   unitPrice: number;  // Đơn giá
   totalAmount: number;  // Thành tiền (VNĐ)
   paymentStatus: string;  // Trạng thái thanh toán
   customerID: string;  // Mã khách hàng
   customerName: string;  // Tên khách hàng
   customerType: string;  // Loại khách hàng
   paymentDate?: string;  // Ngày thanh toán (Optional)
   employee: string;  // Nhân viên
   vehicleNumber: string;  // Biển số xe
   invoiceStatus: string;  // Trạng thái hoá đơn
 
   constructor(
     id: number,
     date: Date,
     time: string,
     station: string,
     pumpPole: string,
     item: string,
     quantity: number,
     unitPrice: number,
     totalAmount: number,
     paymentStatus: string,
     customerID: string,
     customerName: string,
     customerType: string,
     employee: string,
     vehicleNumber: string,
     invoiceStatus: string,
     paymentDate?: string,  // Optional
   ) {
     this.id = id;
     this.date = date;
     this.time = time;
     this.station = station;
     this.pumpPole = pumpPole;
     this.item = item;
     this.quantity = quantity;
     this.unitPrice = unitPrice;
     this.totalAmount = totalAmount;
     this.paymentStatus = paymentStatus;
     this.customerID = customerID;
     this.customerName = customerName;
     this.customerType = customerType;
     this.employee = employee;
     this.vehicleNumber = vehicleNumber;
     this.invoiceStatus = invoiceStatus;
     this.paymentDate = paymentDate;
   }
 }
 