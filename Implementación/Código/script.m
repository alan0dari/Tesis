function [] = script(impath,tmax)

MM=[1 1];
[Particulas, Pareto, Names]=mopso_clahe(impath,tmax);
path=extractBefore(impath, "input");
image = imread(impath);
if ~ismatrix(image)
    image=rgb2gray(image);
end

DM=Pareto(:,4:5);
[m,n]=size(DM);
w1 = weight_entropy(m,n,DM);
w2 = [0.6932, 0.3068];
w3 = [0.90, 0.10];

[~, indice_smarter1]=smarter(m,n,DM,w1,MM);
[~, indice_fuzzy1]=fuzzy(m,n,DM,w1,MM);
[~, indice_topsis1]=topsis(m,n,DM,w1,MM);
[~, indice_saw1]=Fun_SAW(m,n,DM,w1,MM);
[~, indice_codas1]=Fun_CODAS(m,n,DM,w1,MM);
[~, indice_mabac1]=Fun_MABAC(m,n,DM,w1,MM);
[~, indice_vikor1]=Fun_VIKOR(m,n,DM,w1,MM);
[~, indice_promethee1]=Fun_PROMETHEE(m,n,DM,w1,MM);

[~, indice_smarter2]=smarter(m,n,DM,w2,MM);
[~, indice_fuzzy2]=fuzzy(m,n,DM,w2,MM);
[~, indice_topsis2]=topsis(m,n,DM,w2,MM);
[~, indice_saw2]=Fun_SAW(m,n,DM,w2,MM);
[~, indice_codas2]=Fun_CODAS(m,n,DM,w2,MM);
[~, indice_mabac2]=Fun_MABAC(m,n,DM,w2,MM);
[~, indice_vikor2]=Fun_VIKOR(m,n,DM,w2,MM);
[~, indice_promethee2]=Fun_PROMETHEE(m,n,DM,w2,MM);

[~, indice_smarter3]=smarter(m,n,DM,w3,MM);
[~, indice_fuzzy3]=fuzzy(m,n,DM,w3,MM);
[~, indice_topsis3]=topsis(m,n,DM,w3,MM);
[~, indice_saw3]=Fun_SAW(m,n,DM,w3,MM);
[~, indice_codas3]=Fun_CODAS(m,n,DM,w3,MM);
[~, indice_mabac3]=Fun_MABAC(m,n,DM,w3,MM);
[~, indice_vikor3]=Fun_VIKOR(m,n,DM,w3,MM);
[~, indice_promethee3]=Fun_PROMETHEE(m,n,DM,w3,MM);


K=adapthisteq(image,'NumTiles',[Pareto(indice_smarter1,1) Pareto(indice_smarter1,2)],'ClipLimit',Pareto(indice_smarter1,3));
filename=strcat(path,'output/decision/SMARTER-W1-',convertStringsToChars(Names(indice_smarter1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_fuzzy1,1) Pareto(indice_fuzzy1,2)],'ClipLimit',Pareto(indice_fuzzy1,3));
filename=strcat(path,'output/decision/FUZZY-W1-',convertStringsToChars(Names(indice_fuzzy1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_topsis1,1) Pareto(indice_topsis1,2)],'ClipLimit',Pareto(indice_topsis1,3));
filename=strcat(path,'output/decision/TOPSIS-W1-',convertStringsToChars(Names(indice_topsis1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_saw1,1) Pareto(indice_saw1,2)],'ClipLimit',Pareto(indice_saw1,3));
filename=strcat(path,'output/decision/SAW-W1-',convertStringsToChars(Names(indice_saw1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_codas1,1) Pareto(indice_codas1,2)],'ClipLimit',Pareto(indice_codas1,3));
filename=strcat(path,'output/decision/CODAS-W1-',convertStringsToChars(Names(indice_codas1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_mabac1,1) Pareto(indice_mabac1,2)],'ClipLimit',Pareto(indice_mabac1,3));
filename=strcat(path,'output/decision/MABAC-W1-',convertStringsToChars(Names(indice_mabac1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_vikor1,1) Pareto(indice_vikor1,2)],'ClipLimit',Pareto(indice_vikor1,3));
filename=strcat(path,'output/decision/VIKOR-W1-',convertStringsToChars(Names(indice_vikor1)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_promethee1,1) Pareto(indice_promethee1,2)],'ClipLimit',Pareto(indice_promethee1,3));
filename=strcat(path,'output/decision/PROMETHEE-W1-',convertStringsToChars(Names(indice_promethee1)));
imwrite(K, filename);


K=adapthisteq(image,'NumTiles',[Pareto(indice_smarter2,1) Pareto(indice_smarter2,2)],'ClipLimit',Pareto(indice_smarter2,3));
filename=strcat(path,'output/decision/SMARTER-W2-',convertStringsToChars(Names(indice_smarter2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_fuzzy2,1) Pareto(indice_fuzzy2,2)],'ClipLimit',Pareto(indice_fuzzy2,3));
filename=strcat(path,'output/decision/FUZZY-W2-',convertStringsToChars(Names(indice_fuzzy2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_topsis2,1) Pareto(indice_topsis2,2)],'ClipLimit',Pareto(indice_topsis2,3));
filename=strcat(path,'output/decision/TOPSIS-W2-',convertStringsToChars(Names(indice_topsis2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_saw2,1) Pareto(indice_saw2,2)],'ClipLimit',Pareto(indice_saw2,3));
filename=strcat(path,'output/decision/SAW-W2-',convertStringsToChars(Names(indice_saw2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_codas2,1) Pareto(indice_codas2,2)],'ClipLimit',Pareto(indice_codas2,3));
filename=strcat(path,'output/decision/CODAS-W2-',convertStringsToChars(Names(indice_codas2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_mabac2,1) Pareto(indice_mabac2,2)],'ClipLimit',Pareto(indice_mabac2,3));
filename=strcat(path,'output/decision/MABAC-W2-',convertStringsToChars(Names(indice_mabac2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_vikor2,1) Pareto(indice_vikor2,2)],'ClipLimit',Pareto(indice_vikor2,3));
filename=strcat(path,'output/decision/VIKOR-W2-',convertStringsToChars(Names(indice_vikor2)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_promethee2,1) Pareto(indice_promethee2,2)],'ClipLimit',Pareto(indice_promethee2,3));
filename=strcat(path,'output/decision/PROMETHEE-W2-',convertStringsToChars(Names(indice_promethee2)));
imwrite(K, filename);


K=adapthisteq(image,'NumTiles',[Pareto(indice_smarter3,1) Pareto(indice_smarter3,2)],'ClipLimit',Pareto(indice_smarter3,3));
filename=strcat(path,'output/decision/SMARTER-W3-',convertStringsToChars(Names(indice_smarter3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_fuzzy3,1) Pareto(indice_fuzzy3,2)],'ClipLimit',Pareto(indice_fuzzy3,3));
filename=strcat(path,'output/decision/FUZZY-W3-',convertStringsToChars(Names(indice_fuzzy3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_topsis3,1) Pareto(indice_topsis3,2)],'ClipLimit',Pareto(indice_topsis3,3));
filename=strcat(path,'output/decision/TOPSIS-W3-',convertStringsToChars(Names(indice_topsis3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_saw3,1) Pareto(indice_saw3,2)],'ClipLimit',Pareto(indice_saw3,3));
filename=strcat(path,'output/decision/SAW-W3-',convertStringsToChars(Names(indice_saw3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_codas3,1) Pareto(indice_codas3,2)],'ClipLimit',Pareto(indice_codas3,3));
filename=strcat(path,'output/decision/CODAS-W3-',convertStringsToChars(Names(indice_codas3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_mabac3,1) Pareto(indice_mabac3,2)],'ClipLimit',Pareto(indice_mabac3,3));
filename=strcat(path,'output/decision/MABAC-W3-',convertStringsToChars(Names(indice_mabac3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_vikor3,1) Pareto(indice_vikor3,2)],'ClipLimit',Pareto(indice_vikor3,3));
filename=strcat(path,'output/decision/VIKOR-W3-',convertStringsToChars(Names(indice_vikor3)));
imwrite(K, filename);
K=adapthisteq(image,'NumTiles',[Pareto(indice_promethee3,1) Pareto(indice_promethee3,2)],'ClipLimit',Pareto(indice_promethee3,3));
filename=strcat(path,'output/decision/PROMETHEE-W3-',convertStringsToChars(Names(indice_promethee3)));
imwrite(K, filename);


display(strcat("Método=SMARTER, w=[",num2str(w1),"], m=", num2str(Pareto(indice_smarter1,1)), " n=", num2str(Pareto(indice_smarter1,2))," c=", num2str(Pareto(indice_smarter1,3)), " e=", num2str(Pareto(indice_smarter1,4)),  " SSIM=", num2str(Pareto(indice_smarter1,5))));
display(strcat("Método=Fuzzy, w=[",num2str(w1),"], m=", num2str(Pareto(indice_fuzzy1,1)), " n=", num2str(Pareto(indice_fuzzy1,2))," c=", num2str(Pareto(indice_fuzzy1,3)), " e=", num2str(Pareto(indice_fuzzy1,4)),  " SSIM=", num2str(Pareto(indice_fuzzy1,5))));
display(strcat("Método=TOPSIS, w=[",num2str(w1),"], m=", num2str(Pareto(indice_topsis1,1)), " n=", num2str(Pareto(indice_topsis1,2))," c=", num2str(Pareto(indice_topsis1,3)), " e=", num2str(Pareto(indice_topsis1,4)),  " SSIM=", num2str(Pareto(indice_topsis1,5))));
display(strcat("Método=SAW, w=[",num2str(w1),"], m=", num2str(Pareto(indice_saw1,1)), " n=", num2str(Pareto(indice_saw1,2))," c=", num2str(Pareto(indice_saw1,3)), " e=", num2str(Pareto(indice_saw1,4)),  " SSIM=", num2str(Pareto(indice_saw1,5))));
display(strcat("Método=CODAS, w=[",num2str(w1),"], m=", num2str(Pareto(indice_codas1,1)), " n=", num2str(Pareto(indice_codas1,2))," c=", num2str(Pareto(indice_codas1,3)), " e=", num2str(Pareto(indice_codas1,4)),  " SSIM=", num2str(Pareto(indice_codas1,5))));
display(strcat("Método=MABAC, w=[",num2str(w1),"], m=", num2str(Pareto(indice_mabac1,1)), " n=", num2str(Pareto(indice_mabac1,2))," c=", num2str(Pareto(indice_mabac1,3)), " e=", num2str(Pareto(indice_mabac1,4)),  " SSIM=", num2str(Pareto(indice_mabac1,5))));
display(strcat("Método=VIKOR, w=[",num2str(w1),"], m=", num2str(Pareto(indice_vikor1,1)), " n=", num2str(Pareto(indice_vikor1,2))," c=", num2str(Pareto(indice_vikor1,3)), " e=", num2str(Pareto(indice_vikor1,4)),  " SSIM=", num2str(Pareto(indice_vikor1,5))));
display(strcat("Método=PROMETHEE II, w=[",num2str(w1),"], m=", num2str(Pareto(indice_promethee1,1)), " n=", num2str(Pareto(indice_promethee1,2))," c=", num2str(Pareto(indice_promethee1,3)), " e=", num2str(Pareto(indice_promethee1,4)),  " SSIM=", num2str(Pareto(indice_promethee1,5))));


display(strcat("Método=SMARTER, w=[",num2str(w2),"], m=", num2str(Pareto(indice_smarter2,1)), " n=", num2str(Pareto(indice_smarter2,2))," c=", num2str(Pareto(indice_smarter2,3)), " e=", num2str(Pareto(indice_smarter2,4)),  " SSIM=", num2str(Pareto(indice_smarter2,5))));
display(strcat("Método=Fuzzy, w=[",num2str(w2),"], m=", num2str(Pareto(indice_fuzzy2,1)), " n=", num2str(Pareto(indice_fuzzy2,2))," c=", num2str(Pareto(indice_fuzzy2,3)), " e=", num2str(Pareto(indice_fuzzy2,4)),  " SSIM=", num2str(Pareto(indice_fuzzy2,5))));
display(strcat("Método=TOPSIS, w=[",num2str(w2),"], m=", num2str(Pareto(indice_topsis2,1)), " n=", num2str(Pareto(indice_topsis2,2))," c=", num2str(Pareto(indice_topsis2,3)), " e=", num2str(Pareto(indice_topsis2,4)),  " SSIM=", num2str(Pareto(indice_topsis2,5))));
display(strcat("Método=SAW, w=[",num2str(w2),"], m=", num2str(Pareto(indice_saw2,1)), " n=", num2str(Pareto(indice_saw2,2))," c=", num2str(Pareto(indice_saw2,3)), " e=", num2str(Pareto(indice_saw2,4)),  " SSIM=", num2str(Pareto(indice_saw2,5))));
display(strcat("Método=CODAS, w=[",num2str(w2),"], m=", num2str(Pareto(indice_codas2,1)), " n=", num2str(Pareto(indice_codas2,2))," c=", num2str(Pareto(indice_codas2,3)), " e=", num2str(Pareto(indice_codas2,4)),  " SSIM=", num2str(Pareto(indice_codas2,5))));
display(strcat("Método=MABAC, w=[",num2str(w2),"], m=", num2str(Pareto(indice_mabac2,1)), " n=", num2str(Pareto(indice_mabac2,2))," c=", num2str(Pareto(indice_mabac2,3)), " e=", num2str(Pareto(indice_mabac2,4)),  " SSIM=", num2str(Pareto(indice_mabac2,5))));
display(strcat("Método=VIKOR, w=[",num2str(w2),"], m=", num2str(Pareto(indice_vikor2,1)), " n=", num2str(Pareto(indice_vikor2,2))," c=", num2str(Pareto(indice_vikor2,3)), " e=", num2str(Pareto(indice_vikor2,4)),  " SSIM=", num2str(Pareto(indice_vikor2,5))));
display(strcat("Método=PROMETHEE II, w=[",num2str(w2),"], m=", num2str(Pareto(indice_promethee2,1)), " n=", num2str(Pareto(indice_promethee2,2))," c=", num2str(Pareto(indice_promethee2,3)), " e=", num2str(Pareto(indice_promethee2,4)),  " SSIM=", num2str(Pareto(indice_promethee2,5))));


display(strcat("Método=SMARTER, w=[",num2str(w3),"], m=", num2str(Pareto(indice_smarter3,1)), " n=", num2str(Pareto(indice_smarter3,2))," c=", num2str(Pareto(indice_smarter3,3)), " e=", num2str(Pareto(indice_smarter3,4)),  " SSIM=", num2str(Pareto(indice_smarter3,5))));
display(strcat("Método=Fuzzy, w=[",num2str(w3),"], m=", num2str(Pareto(indice_fuzzy3,1)), " n=", num2str(Pareto(indice_fuzzy3,2))," c=", num2str(Pareto(indice_fuzzy3,3)), " e=", num2str(Pareto(indice_fuzzy3,4)),  " SSIM=", num2str(Pareto(indice_fuzzy3,5))));
display(strcat("Método=TOPSIS, w=[",num2str(w3),"], m=", num2str(Pareto(indice_topsis3,1)), " n=", num2str(Pareto(indice_topsis3,2))," c=", num2str(Pareto(indice_topsis3,3)), " e=", num2str(Pareto(indice_topsis3,4)),  " SSIM=", num2str(Pareto(indice_topsis3,5))));
display(strcat("Método=SAW, w=[",num2str(w3),"], m=", num2str(Pareto(indice_saw3,1)), " n=", num2str(Pareto(indice_saw3,2))," c=", num2str(Pareto(indice_saw3,3)), " e=", num2str(Pareto(indice_saw3,4)),  " SSIM=", num2str(Pareto(indice_saw3,5))));
display(strcat("Método=CODAS, w=[",num2str(w3),"], m=", num2str(Pareto(indice_codas3,1)), " n=", num2str(Pareto(indice_codas3,2))," c=", num2str(Pareto(indice_codas3,3)), " e=", num2str(Pareto(indice_codas3,4)),  " SSIM=", num2str(Pareto(indice_codas3,5))));
display(strcat("Método=MABAC, w=[",num2str(w3),"], m=", num2str(Pareto(indice_mabac3,1)), " n=", num2str(Pareto(indice_mabac3,2))," c=", num2str(Pareto(indice_mabac3,3)), " e=", num2str(Pareto(indice_mabac3,4)),  " SSIM=", num2str(Pareto(indice_mabac3,5))));
display(strcat("Método=VIKOR, w=[",num2str(w3),"], m=", num2str(Pareto(indice_vikor3,1)), " n=", num2str(Pareto(indice_vikor3,2))," c=", num2str(Pareto(indice_vikor3,3)), " e=", num2str(Pareto(indice_vikor3,4)),  " SSIM=", num2str(Pareto(indice_vikor3,5))));
display(strcat("Método=PROMETHEE II, w=[",num2str(w3),"], m=", num2str(Pareto(indice_promethee3,1)), " n=", num2str(Pareto(indice_promethee3,2))," c=", num2str(Pareto(indice_promethee3,3)), " e=", num2str(Pareto(indice_promethee3,4)),  " SSIM=", num2str(Pareto(indice_promethee3,5))));


fig_pareto = figure('Name','Frente Pareto','NumberTitle','off');
scatter(Particulas(:,4), Particulas(:,5));
hold on;
scatter(Pareto(:,4),Pareto(:,5),25,'MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
xlabel('Entropía');
ylabel('SSIM');
legend({'Partículas', 'Frente Pareto'})
filename = strcat(path,'pareto.png');
saveas(fig_pareto,filename);

fig_decision1 = figure('Name','Métodos de decisión: W1','NumberTitle','off');
scatter(Pareto(:,4),Pareto(:,5));
hold on
scatter(DM(indice_smarter1,1),DM(indice_smarter1,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_fuzzy1,1),DM(indice_fuzzy1,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_topsis1,1),DM(indice_topsis1,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_saw1,1),DM(indice_saw1,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_codas1,1),DM(indice_codas1,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_mabac1,1),DM(indice_mabac1,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_vikor1,1),DM(indice_vikor1,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_promethee1,1),DM(indice_promethee1,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
xlabel('Entropía');
ylabel('SSIM');
legend({'Frente Pareto', 'Smarter', 'Fuzzy', 'Topsis', 'Saw', 'Codas', 'Mabac', 'Vikor', 'Promethee II'})
filename = strcat(path,'decision_final_w1.png');
saveas(fig_decision1,filename);

fig_decision2 = figure('Name','Métodos de decisión: W2','NumberTitle','off');
scatter(Pareto(:,4),Pareto(:,5));
hold on
scatter(DM(indice_smarter2,1),DM(indice_smarter2,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_fuzzy2,1),DM(indice_fuzzy2,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_topsis2,1),DM(indice_topsis2,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_saw2,1),DM(indice_saw1,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_codas2,1),DM(indice_codas2,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_mabac2,1),DM(indice_mabac2,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_vikor2,1),DM(indice_vikor2,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_promethee2,1),DM(indice_promethee2,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
xlabel('Entropía');
ylabel('SSIM');
legend({'Frente Pareto', 'Smarter', 'Fuzzy', 'Topsis', 'Saw', 'Codas', 'Mabac', 'Vikor', 'Promethee II'})
filename = strcat(path,'decision_final_w2.png');
saveas(fig_decision2,filename);

fig_decision3 = figure('Name','Métodos de decisión: W3','NumberTitle','off');
scatter(Pareto(:,4),Pareto(:,5));
hold on
scatter(DM(indice_smarter3,1),DM(indice_smarter3,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_fuzzy3,1),DM(indice_fuzzy3,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_topsis3,1),DM(indice_topsis3,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_saw3,1),DM(indice_saw3,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_codas3,1),DM(indice_codas3,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
scatter(DM(indice_mabac3,1),DM(indice_mabac3,2),55,'^','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',1.5);
scatter(DM(indice_vikor3,1),DM(indice_vikor3,2),75,'s','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',1.5);
scatter(DM(indice_promethee3,1),DM(indice_promethee3,2),65,'d','MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',1.5);
xlabel('Entropía');
ylabel('SSIM');
legend({'Frente Pareto', 'Smarter', 'Fuzzy', 'Topsis', 'Saw', 'Codas', 'Mabac', 'Vikor', 'Promethee II'})
filename = strcat(path,'decision_final_w3.png');
saveas(fig_decision3,filename);

T = table(Names, Pareto);
writetable(T, strcat(path,'pareto.xlsx'), 'Sheet',1,'Range','A1:H3000')

T = table([Pareto(indice_smarter1,:);Pareto(indice_fuzzy1,:);Pareto(indice_topsis1,:);Pareto(indice_saw1,:);Pareto(indice_codas1,:);Pareto(indice_mabac1,:);Pareto(indice_vikor1,:);Pareto(indice_promethee1,:);Pareto(indice_smarter2,:);Pareto(indice_fuzzy2,:);Pareto(indice_topsis2,:);Pareto(indice_saw2,:);Pareto(indice_codas2,:);Pareto(indice_mabac2,:);Pareto(indice_vikor2,:);Pareto(indice_promethee2,:);Pareto(indice_smarter3,:);Pareto(indice_fuzzy3,:);Pareto(indice_topsis3,:);Pareto(indice_saw3,:);Pareto(indice_codas3,:);Pareto(indice_mabac3,:);Pareto(indice_vikor3,:);Pareto(indice_promethee3,:)]);
writetable(T, strcat(path,'decisiones.xlsx'), 'Sheet',1,'Range','A1:H3000')

save(strcat(path,'script.mat'));
