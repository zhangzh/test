function Pic2Video(dn, picformat,disp_s, saveflag)
% CreatVideoFromPic(dn, picformat,aviname)
% ��ĳ���ļ�����ĳ�ָ�ʽ������ͼƬ�ϳ�Ϊ��Ƶ�ļ�
% dn : �洢ͼƬ���ļ���
% picformat : Ҫ��ȡ��ͼƬ�ĸ�ʽ����png��jpg����ʽ���ַ�������
% disp_s   : ����ʱ��֡��ļ��ʱ�� ��
% saveflag :�洢��Ƶ��־
% example : CreatVideoFromPic( './', 'png','presentation.avi');

    if ~exist(dn, 'dir')
        error('dir not exist!!!!');
    end
    picname=fullfile( dn, strcat('*.',picformat));
    picname=dir(picname);
    aviname = 'result.avi';
    
    if saveflag
        aviobj = VideoWriter(aviname);
        open(aviobj);
    end

    for i=1:length(picname)
        picdata=imread( fullfile(dn, (picname(i,1).name)));
        imshow(picdata)
        text(10, 10, ['frame:',num2str(i)], 'Color', 'white', 'Fontsize', 10);
        pause(disp_s)		
        if saveflag && (~isempty( aviobj.Height))
            if size(picdata,1) ~= aviobj.Height || size(picdata,2) ~= aviobj.Width
                close(aviobj);
                delete( aviname )
                error('����ͼƬ�ĳߴ�Ҫ��ͬ����');
            end
        end
        
        if saveflag
            writeVideo(aviobj,picdata);
        end
    end
    if saveflag
        close(aviobj);
    end
end
