/* 報表接收 2010/01/27 */

/* temp */

function search_go(method,show,seq){
	var s_,e_,d_;
}

/* report 觀看 */

function report_view(method,show,seq){
	var s_,e_,d_,j_,t_,argu_str="",kind="report";
	var c_,w_,crm_,ps_,ph_,u_;
	
	if(show == "1"){
		if(seq == "1"){
			d_ = $('#m_dept').val();
			j_ = $('#m_job').val();
			s_ = $('#m_start_date').val();
			e_ = $('#m_end_date').val();
			w_ = $('#m_workload').val();
			argu_str = "&d="+encodeURIComponent(d_)+"&j="+encodeURIComponent(j_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_)+"&w="+encodeURIComponent(w_);
		}
		else if(seq == "2"){
			c_ = $('#m_customer').val();
			j_ = $('#m_job2').val();
			s_ = $('#m_start_date2').val();
			e_ = $('#m_end_date2').val();
			w_ = $('#m_workload2').val();
			argu_str = "&c="+encodeURIComponent(c_)+"&j="+encodeURIComponent(j_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_)+"&w="+encodeURIComponent(w_);
		}
		else if(seq == "3"){
			t_ = $('#m_type').val();
			j_ = $('#m_job3').val();
			s_ = $('#m_start_date3').val();
			e_ = $('#m_end_date3').val();
			w_ = $('#m_workload3').val();
			argu_str = "&t="+encodeURIComponent(t_)+"&j="+encodeURIComponent(j_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_)+"&w="+encodeURIComponent(w_);
		}
		else if(seq == "4"){
			crm_ = $('#m_crm').val();
			j_ = $('#m_job4').val();
			s_ = $('#m_start_date4').val();
			e_ = $('#m_end_date4').val();
			w_ = $('#m_workload4').val();
			argu_str = "&crm="+encodeURIComponent(crm_)+"&j="+encodeURIComponent(j_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_)+"&w="+encodeURIComponent(w_);
		}
	}
	else if(show == "2"){
		if(seq == "1"){
			d_ = $('#m_odept1').val();
			argu_str = "&d="+encodeURIComponent(d_);
		}
		else if(seq == "2"){
			d_ = $('#m_odept2').val();
			s_ = $('#m_start_date').val();
			e_ = $('#m_end_date').val();
			argu_str = "&d="+encodeURIComponent(d_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "3"){
			d_ = $('#m_odept3').val();
			s_ = $('#m_start_date2').val();
			e_ = $('#m_end_date2').val();
			argu_str = "&d="+encodeURIComponent(d_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "4"){
			u_ = $('#m_user').val();
			s_ = $('#m_start_date3').val();
			e_ = $('#m_end_date3').val();
			kind="timesheet";
			argu_str = "&u="+encodeURIComponent(u_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "6"){
			d_ = $('#m_odept4').val();
			s_ = $('#m_start_date5').val();
			e_ = $('#m_end_date5').val();
			if(date_cal(s_,e_) > 186){
				alert("Half Year Limited");
				return false;
			}
			else{
				argu_str = "&d="+encodeURIComponent(d_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
			}
		}
		else if(seq == "7"){
			d_ = "ANRB210(ID-PD)";
			s_ = $('#m_start_date6').val();
			e_ = $('#m_end_date6').val();
			argu_str = "&d="+encodeURIComponent(d_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
	}
	else if(show == "3"){
		if(seq == "1"){
			d_ = $('#m_dept').val();
			j_ = $('#m_job').val();
			s_ = $('#m_start_date2').val();
			e_ = $('#m_end_date2').val();
		
			if(date_cal(s_,e_) > 31){
				alert("One Month Limited");
				return false;
			}
			else{
				argu_str = "&d="+encodeURIComponent(d_)+"&j="+encodeURIComponent(j_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
			}
		}
		else if(seq == "2"){
			d_ = $('#m_odept1').val();
			argu_str = "&d="+encodeURIComponent(d_);
		}
	}
	else if(show == "4"){
		if(seq == "1"){
			t_ = $('#m_type').val();
			s_ = $('#m_start_date').val();
			e_ = $('#m_end_date').val();
			argu_str = "&t="+encodeURIComponent(t_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "2"){
			t_ = $('#m_customer').val();
			s_ = $('#m_start_date2').val();
			e_ = $('#m_end_date2').val();
			argu_str = "&t="+encodeURIComponent(t_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "3"){
			u_ = $('#m_user').val();
			s_ = $('#m_start_date3').val();
			e_ = $('#m_end_date3').val();
			argu_str = "&u="+encodeURIComponent(u_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
		else if(seq == "4"){
			d_ = $('#m_dept2').val();
			ps_ = $('#m_psort_val').val();
			if(d_==""){
				alert("請選擇部門！");
				return false;
			}
			else if(ps_==""){
				alert("請選擇Project Task！");
				return false;
			}
			else{
				t_ = $('#m_type').val();
				ph_ = $('#m_phase').val();
				s_ = $('#m_start_date4').val();
				e_ = $('#m_end_date4').val();
				argu_str = "&d="+encodeURIComponent(d_)+"&ps="+encodeURIComponent(ps_)+"&t="+encodeURIComponent(t_)+"&ph="+encodeURIComponent(ph_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
			}
		}
		else if(seq == "5"){
			$('#test_5').val("產生報表中...需等待較長時間");
			$('#test_5').attr("disabled", true);
			$('#test_5_area').html("");
			d_ = $('#m_odept1').val();
			s_ = $('#m_start_date5').val();
			e_ = $('#m_end_date5').val();
			argu_str = "&d="+encodeURIComponent(d_)+"&s="+encodeURIComponent(s_)+"&e="+encodeURIComponent(e_);
		}
	}
	//alert(argu_str);
	var url="";
	if(kind=="timesheet")
		url="timesheet_handle.aspx?";
	else
		url="report_handle.aspx?";
	
	var data="method="+encodeURIComponent(method)+"&show="+encodeURIComponent(show)+"&r="+encodeURIComponent(seq)+argu_str+"&timeStamp="+new Date().getTime();
	handleServerResponse_TEXT(url,data);
}