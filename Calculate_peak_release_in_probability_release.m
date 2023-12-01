baseline_c_DA_release_DLS_pro_ie=mode(c_DA_release_DLS_pro_ie(:,1));
baseline_c_DA_release_DLS_pro_ni=mode(c_DA_release_DLS_pro_ni(:,1));
baseline_c_DA_release_NAcc_pro_ie=mode(c_DA_release_NAcc_pro_ie(:,1));
baseline_c_DA_release_NAcc_pro_ni=mode(c_DA_release_NAcc_pro_ni(:,1));

for i=1:4
    peak_c_DA_release_DLS_pro_ie(i,1)=max(c_DA_release_DLS_pro_ie(:,i))-baseline_c_DA_release_DLS_pro_ie;
    peak_c_DA_release_DLS_pro_ni(i,1)=max(c_DA_release_DLS_pro_ni(:,i))-baseline_c_DA_release_DLS_pro_ni;
    peak_c_DA_release_NAcc_pro_ie(i,1)=max(c_DA_release_NAcc_pro_ie(:,i))-baseline_c_DA_release_NAcc_pro_ie;
    peak_c_DA_release_NAcc_pro_ni(i,1)=max(c_DA_release_NAcc_pro_ni(:,i))-baseline_c_DA_release_NAcc_pro_ni;
    %area_c_DA_release_DLS_pro_ie(i,1)=sum(c_DA_release_DLS_pro_ie(DA_release_start:DA_release_end),i)-baseline_c_DA_release_DLS_pro_ie*(DA_release_end-DA_release_start+1);
end
